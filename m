From: Alex Chapman <ajchapman88@hotmail.co.uk>
Subject: nftables setup issues
Date: Fri, 25 Oct 2013 09:57:02 +0100
Message-ID: <DUB109-W3830A6FF0AC8FBC3F59F6CE10D0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,


I have followed the setup in the online howto guide:

<a href="https&#58;&#47;&#47;home.regit.org&#47;netfilter-en&#47;nftables-quick-howto&#47;" target="_blank" class="newlyinsertedlink">https&#58;&#47;&#47;home.regit.org&#47;netfilter-en&#47;nftables-quick-howto&#47;</a>

Only difference being using the following kernel source as per Pablo's recent mail:

<a href="http&#58;&#47;&#47;marc.info&#47;&#63;l&#61;netfilter-devel&#38;m&#61;138176887917614&#38;w&#61;2" target="_blank" class="newlyinsertedlink">http&#58;&#47;&#47;marc.info&#47;&#63;l&#61;netfilter-devel&#38;m&#61;138176887917614&#38;w&#61;2</a>


git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nftables.git net-next

When I attempt to run nft -f files/nftables/ipv4-filter I get the following error:

In file included from internal:0:0-0:
files/nftables/ipv4-filter:3:1-2: Error: Could not add table: Invalid argument
table filter {
^^

Any ideas as to why this is happening?

Thanks,
Alex 		 	   		  