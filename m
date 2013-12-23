From: Alexis Salinas <alexis.salinas@inmotiontechnology.com>
Subject: arptables FORWARD chain not working
Date: Mon, 23 Dec 2013 22:50:51 +0000
Message-ID: <42c1dff2725841749ef3a545520f61d1@BN1PR01MB037.prod.exchangelabs.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi All,
I tried using arptables  on a linux internet gateway to filter out packets that have the source MAC address of the internet connected interface but not its IP address (see below).  
I didn't get any hits, although I now there were packets matching the rule. 
The same rule in the OUTPUT chain works as expected (by me at least) . Is there something else I need to do to use the FORWARD chain? 

I'm running kernel 2.6.32.


arptables -I FORWARD 1 -o eth0.164 --source-mac 00:24:E6:00:00:3E -s ! 25.34.56.78 -j DROP

arptables -I OUTPUT 1 -o eth0.164 --source-mac 00:24:E6:00:00:3E -s ! 25.34.56.78 -j DROP