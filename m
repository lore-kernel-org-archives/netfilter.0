From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Broadcast layer2 forwarding (ff:ff:ff:ff:ff:ff)
Date: Mon, 6 Jan 2003 17:01:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301061701.09607.netfilter@newkirk.us>
References: <407C4612AF574244AD03C43504FB74CB19A74F@alexva-mail.aes.de.ittind.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <407C4612AF574244AD03C43504FB74CB19A74F@alexva-mail.aes.de.ittind.com>
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
To: "Shook, Tim - AES" <Tim.Shook@itt.com>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Monday 06 January 2003 11:52 am, Shook, Tim - AES wrote:
> Hello,
>             I'm currently trying something rather unique with IPtables
> and need an opinion.  I'm trying to forward and manipulate a packet
> with the following ip address:
>
> Source 192.0.0.1
>
> Destination 192.0.0.2
>
> If the MAC addresses on these are standard, manufacturer assigned
> addresses, everything works fine.  If I manipulate the MACs with
> ifconfig and set them to ALMOST any other MAC, everything works fine,
> however when I set the MAC to a layer 2 broadcast (FF:FF:FF:FF:FF:FF),
> IPTables stops forwarding the packet.
>
> Now, the question is:
>
> Where is this packet being trapped and dropped?  Is it in the kernel
> (routing)? Or is IPtables dropping it?  Is the Ethernet card dropping
> it?

Try adding a LOG rule as the first rule in each and every chain.  The=20
following example is extracted from my own firewall script, where I call=20
"service firewall xlog" to enable 'extreme logging', then "service=20
firewall xlogx" to disable it, and those script parameters trigger the=20
following functions:

# add_full_logging() enables extreme logging,  ALL TRAFFIC
add_full_logging(){
$IPTABLES -t filter -I INPUT 1 -j LOG --log-prefix "IPT:XL-FILT-IN:"
$IPTABLES -t filter -I OUTPUT 1 -j LOG --log-prefix "IPT:XL-FILT-OUT:"
$IPTABLES -t filter -I FORWARD 1 -j LOG --log-prefix "IPT:XL-FILT-FWD:"
$IPTABLES -t nat -I OUTPUT 1 -j LOG --log-prefix "IPT:XL-NAT-OUT:"
$IPTABLES -t nat -I PREROUTING 1 -j LOG --log-prefix "IPT:XL-NAT-PRE:"
$IPTABLES -t nat -I POSTROUTING 1 -j LOG --log-prefix "IPT:XL-NAT-POST:"
$IPTABLES -t mangle -I INPUT 1 -j LOG --log-prefix "IPT:XL-MANG-IN:"
$IPTABLES -t mangle -I OUTPUT 1 -j LOG --log-prefix "IPT:XL-MANG-OUT:"
$IPTABLES -t mangle -I PREROUTING 1 -j LOG --log-prefix=20
"IPT:XL-MANG-PRE:"
$IPTABLES -t mangle -I POSTROUTING 1 -j LOG --log-prefix=20
"IPT:XL-MANG-POST:"
$IPTABLES -t mangle -I FORWARD 1 -j LOG --log-prefix "IPT:XL-MANG-FWD:"
}

end_full_logging(){
$IPTABLES -t filter -D INPUT -j LOG --log-prefix "IPT:XL-FILT-IN:"
$IPTABLES -t filter -D OUTPUT -j LOG --log-prefix "IPT:XL-FILT-OUT:"
$IPTABLES -t filter -D FORWARD -j LOG --log-prefix "IPT:XL-FILT-FWD:"
$IPTABLES -t nat -D OUTPUT -j LOG --log-prefix "IPT:XL-NAT-OUT:"
$IPTABLES -t nat -D PREROUTING -j LOG --log-prefix "IPT:XL-NAT-PRE:"
$IPTABLES -t nat -D POSTROUTING -j LOG --log-prefix "IPT:XL-NAT-POST:"
$IPTABLES -t mangle -D INPUT -j LOG --log-prefix "IPT:XL-MANG-IN:"
$IPTABLES -t mangle -D OUTPUT -j LOG --log-prefix "IPT:XL-MANG-OUT:"
$IPTABLES -t mangle -D PREROUTING -j LOG --log-prefix "IPT:XL-MANG-PRE:"
$IPTABLES -t mangle -D POSTROUTING -j LOG --log-prefix=20
"IPT:XL-MANG-POST:"
$IPTABLES -t mangle -D FORWARD -j LOG --log-prefix "IPT:XL-MANG-FWD:"
}

Once you log a few attempts to connect, shut the logging off and examine=20
the logfile results.  2-3 pings is sufficient, but if you have other=20
traffic at the same time then add "-p icmp" to each rule to avoid=20
excess.  You should be able to (ordinarily) follow a packet as it hits=20
manglePRE, natPRE, then either mangleIN and filterIN, or mangleFORWARD,=20
filterFORWARD, natPOST, and finally manglePOST.  If you see absolutely=20
nothing then it's never reaching the firewall rules at all.  Otherwise=20
you should be able to follow it through the chains and see which two it=20
disappears between.  If it vanishes after natPRE then it is being=20
dropped in the routing decision.

> I'm going to try to build a test version of the latest iptables source
> and put some debug stuff in to find out if iptables is seeing this
> packet, however I was hoping someone well educated with IPtables might
> enlighten me as too what is happening here.

To just 'find out if iptables is seeing it' all you should need are the=20
log rules above.

j

> NOTE:  I am fully aware of the bizarre setup that I am using and the
> MAC layer address issue.  This is not standard.  I've been tasked to
> fix a custom software broken IP problem with a device that will mangle
> packets for me and retransmit them as if they were not broken.  Linux
> is of course the obvious choice and iptables does 99.9999 % of what I
> need it to do.  It works fine and does well up to this broadcast MAC.=20
> I just can't get passed this last hurdle.
>
> Any ideas or suggestions would be helpful
>
> Thanks
>
> Tim
> ************************************
> If this email is not intended for you, or you are not responsible for
> the delivery of this message to the addressee, please note that this
> message may contain ITT Privileged/Proprietary Information.  In such a
> case, you may not copy or deliver this message to anyone.  You should
> destroy this message and kindly notify the sender by reply email.=20
> Information contained in this message that does not relate to the
> business of ITT is neither endorsed by nor attributable to ITT.
> ************************************


