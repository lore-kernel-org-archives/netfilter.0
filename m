From: "Pierluigi Frullani" <pigi@frumar.it>
Subject: Re: Tcpdump and libipq
Date: Fri, 10 Oct 2003 09:52:03 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <51014.212.239.118.101.1065772323.squirrel@www.frumar.it>
Reply-To: pierluigi.frullani@frumar.it
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: Oumer Teyeb <oumer@kom.auc.dk>
Cc: netfilter@lists.netfilter.org

> Hi,

> Then I did an FTP session, and I have a very perplexing result:
> There is a 1 second diff between the timestamps in the data I set and
> the ones from tcpdump, but only when the packets are outgoing.
> For incoming packets it seems the tcpdump timestamp and the timestamp of
> packet from libipq seem the same (ofcourse there can be some microsecond
> differences). Why is it happening this way, and is there a possiblity of
> making tcpdump to save the data only after libipq has taken care of them?

I'm not an expert, but also from my tests, it seems to work the way you
explained before.
This is a bit annoying, because every application based on pcap ( tcpdump,
snort, iptraf ) are not ( completely ) useful for testing purpose.
I have a firewall with an IDS running on the same machine, and set up some
rule to block some suspicious traffic.
The rules are working, as I can see from the iptables logs, and from
sniffing the INSIDE side of the firewall, but if I sniff (tcpdump/iptraf)
the OUTSIDE interface OR if I get a look in snort logs, I can notice those
suspicious packet entering the interface.
Unfortunally this gives me a lot of false positive alert, because the
snort read the packets BEFORE they reach the iptables ( kernel side ).
HTH
Pigi

