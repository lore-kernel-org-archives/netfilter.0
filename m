From: Ryan Hoegg <rhoegg@isisnetworks.net>
Subject: Re: iptables vs cisco pix
Date: Mon, 07 Oct 2002 16:41:28 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA1F178.6060901@isisnetworks.net>
References: <40410.67.118.146.230.1033576589.squirrel@highwayshouse.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

This topic has come up before.  You need to specify your security 
requirements by building an enterprise security policy before you can 
choose your tools to implement that policy.  PIX and other commercial 
firewalls give you a lot more than packet filtering and NAT.  VPNs, log 
analyzers, clustering, and intrusion detection are some of the features 
you will not see in vanilla linux + iptables.  If your policy needs 
these features, you can give your clients a proposal for your time to 
install, configure, and document a custom linux based solution and 
compare that with the purchase, installation, and configuration of a PIX.

You may find that a Watchguard Firebox is your best bet, especially 
since it runs linux and iptables under the hood.

--
Ryan Hoegg
ISIS Networks

Mike Hull wrote:

>Does anyone know where I could find a comparison of linux+iptables vs
>cisco pix?  I'm trying to convence a couple health care organizations to
>get linux boxes rather than cisco pix solutions.  These people are stuck
>on cisco.  Everything they have is overpriced cisco garbage.  Personally,
>I have compared them, and I have had to replace cisco equipment with an
>iptables firewall.  I don't think they're just going to take my word for
>it though.
>
>Thanks,
>Mike
>


