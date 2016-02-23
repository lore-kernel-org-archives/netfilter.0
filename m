From: Travis Garrison <travis@netviscom.com>
Subject: NAT Pool
Date: Tue, 23 Feb 2016 13:09:37 -0500 (EST)
Message-ID: <1348593641.674234.1456250977299.JavaMail.zimbra@netviscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am working on setting up a new router for our network and im trying to figure out the NAT rules. We have several VLANs that we need to enable PAT on. The issue comes from that we have several public IP addresses that we would like to use in the PAT pool. How would we be able to go about this. We are not doing anything special like port forwarding or redirection. 

Internal IP addresses: 
192.168.0.0/24 
192.168.1.0/24 
192.168.2.0/24 
192.168.3.0/24 
192.168.4.0/24 
192.168.5.0/24 
192.168.6.0/24 
192.168.7.0/24 
....we have around 150 networks, using the 192, 172 and 10 ranges 

Public IP ranges: 
x.x.252.0/24 
x.x.254.0/24 
x.x.173.0/24 

We are currently using a Cisco FWSM with a few PAT IP's setup but the issue is it will use 1:1 NAT until all Public IPs are used the PAT the rest to a single IP address. We would like to PAT to all addresses in a round-robin fashion. 

Thank you 
Travis Garrison
