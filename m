From: Aki Karjalainen <akarjala@sci.fi>
Subject: IPTables design question (nat)
Date: 01 Nov 2002 21:41:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036179693.23663.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi.

I've got a question about IPTables.

Let's say I want to "hide" a public IP pool (e.g. 144.50.50.0/24) behing
NAT. Easy.

Let's say I want to provide SMTP port from LAN to the outside world. I'd
say "-t nat -A PREROUTING -p tcp -d FWexternalIP --dport smtp -j DNAT
--to 144.50.50.12:smtp".

Ok, I'd still have to allow the connection in the BAD-GOOD chain for
this to work.

The result is that the outside world sees the smtp port from the
firewall external IP _as well as_ directly from 144.50.50.12. 

The question is how to hide 144.50.50.12:smtp but still allow firewall
external ip:smtp (DNATted port)?


Summary: How to DNAT some port and still hide the destination IP+port in
the case the real destination IP is a public IP address?



