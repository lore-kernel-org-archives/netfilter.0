From: Cyberdude Murli <murli_laptop@yahoo.com>
Subject: Requirements for a NAT system.
Date: Fri, 27 Jun 2003 02:08:02 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030627090802.27341.qmail@web13307.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-2145844358-1056704882=:25271"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

--0-2145844358-1056704882=:25271
Content-Type: text/plain; charset=us-ascii

Dear All,
 
I am under a process to get the following developed. Before I begin, please let me know if you have any views/already development done along these lines.
 
Requirements for a NAT system.
Objectives of the system:
 Provide online customers with individual public IPs to conserve public IP addresses.
Scenario:
 Currently all customers are assigned private IP addresses. They are being NAT overloaded (CISCO term)/SNATed 
(iptables term) to a single public IP address. Several applications do not work due to the reverse connections not allowed to 
be initiated into the customer equipment directly.
 There are several subnets to be controlled, can't have DHCP implemented per subnet.
Required:
 List of allowed public IP to be allocated
 List of allowed private IP to be processed
 Provide static allocation of public IP to private IPs on one to one basis.
 Allocate an available public IP to a private IP on detection of an outgoing connection.
 A session is considered when an initial outgoing connection from a customer is detected upto the time when the 
customer does not have traffic for 10 continious minutes.
 Create a one-to-one NAT rule so that the customer private IP is NATted to the public IP for a session.
 This will allow customer to accept connections on the public IP address assigned for that session.
 After a session ends the public IP should be made available for another customer
 Logging - Session id, start time, private IP, public IP, end time, number of bytes passed tx and rx, etc.

 
Regards,
 
Murli
 


---------------------------------
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
--0-2145844358-1056704882=:25271
Content-Type: text/html; charset=us-ascii

<DIV>Dear All,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I am under a process to get the following developed. Before I begin, please let me know if you have any views/already development done along these lines.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Requirements for a NAT system.</DIV>
<DIV>Objectives of the system:<BR>&nbsp;Provide online customers with individual public IPs to conserve public IP addresses.</DIV>
<DIV>Scenario:<BR>&nbsp;Currently all customers are assigned private IP addresses. They are being NAT overloaded (CISCO term)/SNATed </DIV>
<DIV>(iptables term) to a single public IP address. Several applications do not work due to the reverse connections not allowed to </DIV>
<DIV>be initiated into the customer equipment directly.<BR>&nbsp;There are several subnets to be controlled, can't have DHCP implemented per subnet.</DIV>
<DIV>Required:<BR>&nbsp;List of allowed public IP to be allocated<BR>&nbsp;List of allowed private IP to be processed</DIV>
<DIV>&nbsp;Provide static allocation of public IP to private IPs on one to one basis.<BR>&nbsp;Allocate an available public IP to a private IP on detection of an outgoing connection.</DIV>
<DIV>&nbsp;A session is considered when an initial outgoing connection from a customer is detected upto the time when the </DIV>
<DIV>customer does not have traffic for 10 continious minutes.<BR>&nbsp;Create a one-to-one NAT rule so that the customer private IP is NATted to the public IP for a session.<BR>&nbsp;This will allow customer to accept connections on the public IP address assigned for that session.<BR>&nbsp;After a session ends the public IP should be made available for another customer</DIV>
<DIV>&nbsp;Logging - Session id, start time, private IP, public IP, end time, number of bytes passed tx and rx, etc.<BR></DIV>
<DIV>&nbsp;</DIV>
<DIV>Regards,</DIV>
<DIV>&nbsp;</DIV>
<DIV>Murli</DIV>
<DIV>&nbsp;</DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://pa.yahoo.com/*http://rd.yahoo.com/evt=1207/*http://promo.yahoo.com/sbc/">SBC Yahoo! DSL</a> - Now only $29.95 per month!
--0-2145844358-1056704882=:25271--

