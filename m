From: Juergen Schmidt <ju@ct.heise.de>
Subject: using iptables states to avoid pppd timeout problems ?
Date: Thu, 21 Nov 2002 16:45:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DDCFF94.80A3DBBC@ct.heise.de>
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

Hello,

I get an increasing number of reports from people, who have to pay a lot
of money, because their linux router didn't close an open internet
connection. In many cases, those people 
just had bad luck, and they received the (dynamic) ip adress of a former
edonkey participant (or any other p2p net). Because edonkey links live
quite long, even after somebody quit the net, clients still send their
requests to this adress.

One strategy to avoid this, is starting ppp with the following option:

       active-filter filter-expression
              Specifies  a  packet  filter  to be applied to data
              packets  to  determine  which  packets  are  to  be
              regarded  as link activity, and therefore reset the
              idle timer, or cause the link to be brought  up  in
              demand-dialling  mode.

The filter-expression is specified in tcpdump syntax. This means it
works like a dumb packet filter. This has the drawback, that established
connections, that match, also do not get counted and might get
interrupted. And it still leaves the door open for a "Enforcement of
Service" attack -- i.e. somebody can keep my link open, by just sending
an unsolicited packet every now and then.

The better way to get hold of this, would be to use something like
iptables/netfilter rules and count only packets of "ESTABLISHED"
connections (or ignore state "NEW").

Is there a way to do this. 
Is it perhaps possible to do something like this in iptables PREROUTING
chain? Perhaps mark the packtes as "to be counted" ?

thanks in advance, juergen 

PS:
Please CC any answers to me, as I do not regularly read this list.

-- 
Juergen Schmidt   Leitender Redakteur/senior editor  c't magazin
Heise Zeitschriften Verlag,  Helstorferstr. 7,  D-30625 Hannover
Tel. +49 511 5352 300 FAX +49 511 5352 417  EMail ju@ct.heise.de

