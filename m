From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: RE: Dynamic IP in ADSL
Date: Tue, 25 Nov 2003 09:56:09 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA57ABA@OST_EXCH_USR5>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Alejandro

I've been doing a similar thing and you can use ppp0 and it'll work no
problems.  I believe that you should use MASQUERADE if you are likely to
have your external ppp0 IP address change.

Hope that answers the question!

Steve



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Alejandro Cabrera
Obed
Sent: 24 November 2003 19.54
To: Netfilter lista (iptables)
Subject: Dynamic IP in ADSL


Hello, I have an ADSL connection to Internet and I want to set an Iptables
firewall. Just one  question:

Do I have to use in my firewall script the IP of my ADSL interface or just
do I have to use the "ppp0" variable and don't care of the IP address
assignment changes ???

Thnks again.

Alejandro




.


-----------------------------------------------------------------------
Information in this email may be privileged, confidential and is 
intended exclusively for the addressee.  The views expressed may
not be official policy, but the personal views of the originator.
If you have received it in error, please notify the sender by return
e-mail and delete it from your system.  You should not reproduce, 
distribute, store, retransmit, use or disclose its contents to anyone.
 
Please note we reserve the right to monitor all e-mail
communication through our internal and external networks.
-----------------------------------------------------------------------


