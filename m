From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: How to stop the flood?
Date: Sun, 01 May 2005 14:19:24 -0500
Message-ID: <42752BBC.8000203@riverviewtech.net>
References: <20050428154656.AA0188EDCEB@smtp.sterenborg.info>	<1114703659.6fb8089c0e877@webmail.harrisonburg.k12.va.us>	<035101c54c15$2edb10e0$3b3429c4@rp>	<4271A606.9090504@riverviewtech.net>
	<42742A0C.5040808@danbbs.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42742A0C.5040808@danbbs.dk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> If clients can change IP's on the fly, they can change MAC's all the 
> same. Of cause, arranging DHCP on a per-client-based-on-MAC scheme will 
> catch this behavior (which you more or less pointed out).

Rather than DROPing based on a known IP/MAC pair you could accept based on IP/MAC pair thus if the client did change things on you they would not be able to get to the internet.  This is normally how this works.  About the only caveat that I can see for this would be if a client switched NICs with another client.

> So you chose IMAP merely as an example.. Meaning you'd do similarly for 
> other services if interest, right?  Good idea, tnx.

Exactly

iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p tcp --dport 20
iptables -t filter -A FORWARD -o $Client_1 -d $Client_1_Subnet -p tcp --sport 20
iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p tcp --dport 21
iptables -t filter -A FORWARD -o $Client_1 -d $Client_1_Subnet -p tcp --sport 21
iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p tcp --dport 22
iptables -t filter -A FORWARD -o $Client_1 -d $Client_1_Subnet -p tcp --sport 22
iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p tcp --dport 23
iptables -t filter -A FORWARD -o $Client_1 -d $Client_1_Subnet -p tcp --sport 23
iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p tcp --dport 25
iptables -t filter -A FORWARD -o $Client_1 -d $Client_1_Subnet -p tcp --sport 25
iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p tcp --dport 53
iptables -t filter -A FORWARD -o $Client_1 -d $Client_1_Subnet -p tcp --sport 53
iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p udp --dport 53
iptables -t filter -A FORWARD -o $Client_1 -d $Client_1_Subnet -p udp --sport 53
iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p tcp --dport 80
iptables -t filter -A FORWARD -o $Client_1 -d $Client_1_Subnet -p tcp --sport 80
iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p tcp --dport 110
iptables -t filter -A FORWARD -o $Client_1 -d $Client_1_Subnet -p tcp --sport 110
iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p tcp --dport 119
iptables -t filter -A FORWARD -o $Client_1 -d $Client_1_Subnet -p tcp --sport 119
iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p tcp --dport 143
iptables -t filter -A FORWARD -o $Client_1 -d $Client_1_Subnet -p tcp --sport 143
iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p tcp --dport 443
iptables -t filter -A FORWARD -o $Client_1 -d $Client_1_Subnet -p tcp --sport 443

iptables -t filter -A FORWARD -i $Client_2 -s $Client_2_Subnet -p tcp --dport 20
iptables -t filter -A FORWARD -o $Client_2 -d $Client_2_Subnet -p tcp --sport 20
iptables -t filter -A FORWARD -i $Client_2 -s $Client_2_Subnet -p tcp --dport 21
iptables -t filter -A FORWARD -o $Client_2 -d $Client_2_Subnet -p tcp --sport 21
iptables -t filter -A FORWARD -i $Client_2 -s $Client_2_Subnet -p tcp --dport 22
iptables -t filter -A FORWARD -o $Client_2 -d $Client_2_Subnet -p tcp --sport 22
iptables -t filter -A FORWARD -i $Client_2 -s $Client_2_Subnet -p tcp --dport 23
iptables -t filter -A FORWARD -o $Client_2 -d $Client_2_Subnet -p tcp --sport 23
iptables -t filter -A FORWARD -i $Client_2 -s $Client_2_Subnet -p tcp --dport 25
iptables -t filter -A FORWARD -o $Client_2 -d $Client_2_Subnet -p tcp --sport 25
iptables -t filter -A FORWARD -i $Client_2 -s $Client_2_Subnet -p tcp --dport 53
iptables -t filter -A FORWARD -o $Client_2 -d $Client_2_Subnet -p tcp --sport 53
iptables -t filter -A FORWARD -i $Client_2 -s $Client_2_Subnet -p udp --dport 53
iptables -t filter -A FORWARD -o $Client_2 -d $Client_2_Subnet -p udp --sport 53
iptables -t filter -A FORWARD -i $Client_2 -s $Client_2_Subnet -p tcp --dport 80
iptables -t filter -A FORWARD -o $Client_2 -d $Client_2_Subnet -p tcp --sport 80
iptables -t filter -A FORWARD -i $Client_2 -s $Client_2_Subnet -p tcp --dport 110
iptables -t filter -A FORWARD -o $Client_2 -d $Client_2_Subnet -p tcp --sport 110
iptables -t filter -A FORWARD -i $Client_2 -s $Client_2_Subnet -p tcp --dport 119
iptables -t filter -A FORWARD -o $Client_2 -d $Client_2_Subnet -p tcp --sport 119
iptables -t filter -A FORWARD -i $Client_2 -s $Client_2_Subnet -p tcp --dport 143
iptables -t filter -A FORWARD -o $Client_2 -d $Client_2_Subnet -p tcp --sport 143
iptables -t filter -A FORWARD -i $Client_2 -s $Client_2_Subnet -p tcp --dport 443
iptables -t filter -A FORWARD -o $Client_2 -d $Client_2_Subnet -p tcp --sport 443

etc.  These rules will have their counter incremented for every packet that passes to or from one of your client's interfaces and subnets.  This way you will have an idea how much traffic of each type they generate.

If you were really curious you could do something like the following too:

iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p tcp --sport 0:1023 --dport 80
iptables -t filter -A FORWARD -o $Client_1 -d $Client_1_Subnet -p tcp --sport 80 --dport 0:1023
iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p tcp --sport 1024:65535 --dport 80
iptables -t filter -A FORWARD -o $Client_1 -d $Client_1_Subnet -p tcp --sport 80 --dport 1024:65535

This will tell you the amount of traffic for each type originating from the non ephemeral range and how much traffic is originating from the ephemeral range.  IMHO *MOST* if not all of the client web traffic to web servers should originate from ephemeral ports.



Grant. . . .

