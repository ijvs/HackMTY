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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
        let cell = tableView.dequeueReusableCellWithIdentifier("MapCell", forIndexPath: indexPath) as! MapCell
            cell.setCell("Algo")
            cell.userInteractionEnabled = false
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("DescriptionCell", forIndexPath: indexPath) as! DescriptionCell
            cell.setCell("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porta nisl tellus, in fringilla velit rhoncus eget. Donec pulvinar neque quam, a feugiat lectus dictum quis. Proin dignissim justo sit amet ligula viverra, euismod euismod erat elementum. Morbi bibendum eros sit amet ligula consequat convallis. Nam at turpis ac tellus vulputate faucibus. Donec vel velit accumsan erat malesuada laoreet in ac est. Pellentesque et orci egestas urna interdum posuere. Etiam eget sapien nec purus facilisis interdum ornare ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer volutpat lectus in urna fringilla blandit.")
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
            return 350
        default:
            return 100
            
        }
    }
    

    @IBAction func back(sender: UIBarButtonItem) {
        popTransitionAnimation()
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 2 {
            let paymentRequest = PKPaymentRequest()
            paymentRequest.currencyCode = "USD"
            paymentRequest.countryCode = "US"
            paymentRequest.merchantIdentifier = "merchant.space.siker.testpay"
            paymentRequest.supportedNetworks = [PKPaymentNetworkAmex,PKPaymentNetworkVisa, PKPaymentNetworkMasterCard]
            paymentRequest.merchantCapabilities = .Capability3DS
            paymentRequest.requiredShippingAddressFields = .None
            paymentRequest.paymentSummaryItems = [PKPaymentSummaryItem(label: "Experiencia", amount: 1200.00)]
            var payController = PKPaymentAuthorizationViewController(paymentRequest: paymentRequest)
            print(payController.description)
            payController.delegate = self
            self.presentViewController(payController, animated: true, completion: nil)
        }
    }
    
}


extension ExpandingTableViewController {
    public func paymentAuthorizationViewController(controller: PKPaymentAuthorizationViewController, didSelectPaymentMethod paymentMethod: PKPaymentMethod, completion: ([PKPaymentSummaryItem]) -> Void) {
        
    }
    public func paymentAuthorizationViewControllerDidFinish(controller: PKPaymentAuthorizationViewController) {
    }
    
    public func paymentAuthorizationViewController(controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: (PKPaymentAuthorizationStatus) -> Void) {
        
    }
    
}
