From: "Hard__warE" <hard__ware@hotmail.com>
Subject: SNAT Multiple IP Help Please ?
Date: Sat, 8 Jun 2002 08:16:15 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <000f01c20e70$f06e9460$7b0010ac@dynamicaccess.lan>
Reply-To: "Hard__warE" <hard__ware@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hello Again,

Everyone,


I need some help please

what would be the best Method / Command Syntax for iptables to

have the Following Setup ..


Legend: Ox = Some Iptables box

 N  = Central Network (Exspansion is a must, this can be some huge Extreme
Networks   Layer 2,3,4 Switch / Router all in one Modular solution so Be it
... :D)

 [x] = Each of these networks is to be on the same Network / Netmask for
Example.
  203.39.49.* is for clients on each of these networks.

 so How do you get these address's to appear as there respective client IP
 on the Internet.(all the Ox Gateways have there gateway as the /// Internet
link, this  link would also have to contain that full address range)

 So a client on the internet can connect trough the firewalls to the correct
IP or even
 a person on another network / RAS Dialinsever ...

Small Diagram :-) ..

 [A]-----O1-----|----Ox----[Future Networks]
                          |
                          |
 [B]-----O2----N--///--(Future High Speed Internet Gateway)
                          |
                          |
 [C]-----O3-----|----\\\-(Future Dial In)--


 Would this Method work

 what PreRouting / PostRouting / SNAT Rules do i need ???


 Help Would be good ... :D

thanks


