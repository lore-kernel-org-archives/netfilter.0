From: "Williamson, Fionn" <FWilliamson@fnb.co.za>
Subject: iptables, stateful checking using tcp sequence numbers
Date: Tue, 7 May 2002 11:58:54 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <67024BB66045D511A9380000F6B2EF85F20C1F@RBGMSG02>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

Hi All,

I hope somebody can assist me in finding information about this...

Please consider the following argument:

"Although the TCP sequence numbers may get sent to the log file (if
logging is turned on for a rule), if it not present in the "state table"
(/proc/net/ip_conntrack), then it is not used to maintain state.
However, I cannot verify that Firewall-1 does this as well (although any
good firewall should), and tests conducted on older versions of
Firewall-1 indicate that it did not used to use sequence numbers as part
of state verification (and may still not use them). "

Can anybody PLEASE tell me:

1. if the sequence numbers are actually used in iptables to MAINTAIN the
state of a connection, or if it is merely used to ESTABLISH connections,
and thereafter ignored.

2. point me towards documentation confirming or denying this.

Thank you very much

Jacques Botha

jacquesb@fnb.co.za
South Africa
  

___________________________________________________________________________________________________


The views expressed in this email are, unless otherwise stated, those of the author and not those
of the FirstRand Banking Group or its management.  The information in this e-mail is confidential
and is intended solely for the addressee. Access to this e-mail by anyone else is unauthorised. 
If you are not the intended recipient, any disclosure, copying, distribution or any action taken or 
omitted in reliance on this, is prohibited and may be unlawful.
Whilst all reasonable steps are taken to ensure the accuracy and integrity of information and data 
transmitted electronically and to preserve the confidentiality thereof, no liability or 
responsibility whatsoever is accepted if information or data is, for whatever reason, corrupted 
or does not reach its intended destination.

                               ________________________________

