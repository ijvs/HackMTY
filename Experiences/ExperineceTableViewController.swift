//
//  ExperineceTableViewController.swift
//  Experiences
//
//  Created by Jonathan Velazquez on 28/08/16.
//  Copyright © 2016 Abner Iván Castro Aguilar. All rights reserved.
//

import UIKit
import expanding_collection
import PassKit


class ExperineceTableViewController: ExpandingTableViewController,PKPaymentAuthorizationViewControllerDelegate {

    private var scrollOffsetY: CGFloat = 0
    var e:Experience!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
        let cell = tableView.dequeueReusableCellWithIdentifier("MapCell", forIndexPath: indexPath) as! MapCell
            cell.setCell(e)
            cell.userInteractionEnabled = false
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("DescriptionCell", forIndexPath: indexPath) as! DescriptionCell
            cell.setCell(e.description)
            cell.userInteractionEnabled = false
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("PriceCell", forIndexPath: indexPath)
            var lb = cell.viewWithTag(11) as! UILabel
            lb.text = "$ \(e.price)0"
            cell.userInteractionEnabled = false
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("PayCell", forIndexPath: indexPath)
            return cell
        }
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 150;
        case 1:
            return 440
        case 2:
            return 50
        default:
            return 100
            
        }
    }
    

    @IBAction func back(sender: UIBarButtonItem) {
        popTransitionAnimation()
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 3 {
            let paymentRequest = PKPaymentRequest()
            paymentRequest.currencyCode = "USD"
            paymentRequest.countryCode = "US"
            paymentRequest.merchantIdentifier = "merchant.space.siker.testpay"
            paymentRequest.supportedNetworks = [PKPaymentNetworkAmex,PKPaymentNetworkVisa, PKPaymentNetworkMasterCard]
            paymentRequest.merchantCapabilities = .Capability3DS
            paymentRequest.requiredShippingAddressFields = .None
            paymentRequest.paymentSummaryItems = [PKPaymentSummaryItem(label: "Experiencia", amount: NSDecimalNumber(double: e.price))]
            var payController = PKPaymentAuthorizationViewController(paymentRequest: paymentRequest)
            print(payController.description)
            
            if PKPaymentAuthorizationViewController.canMakePaymentsUsingNetworks([PKPaymentNetworkAmex,PKPaymentNetworkVisa, PKPaymentNetworkMasterCard]) {
                payController.delegate = self
                self.presentViewController(payController, animated: true, completion: nil)
            }
        }
    }
    
    
}


extension ExpandingTableViewController {
    public func paymentAuthorizationViewController(controller: PKPaymentAuthorizationViewController, didSelectPaymentMethod paymentMethod: PKPaymentMethod, completion: ([PKPaymentSummaryItem]) -> Void) {
        
    }
    public func paymentAuthorizationViewControllerDidFinish(controller: PKPaymentAuthorizationViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    public func paymentAuthorizationViewController(controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: (PKPaymentAuthorizationStatus) -> Void) {
        
    }
    
    
}
