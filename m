From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Transparent proxy where source IP address remains unchanged --
 possible?
Date: Mon, 15 Aug 2005 09:39:22 -0500
Message-ID: <4300A91A.5040505@riverviewtech.net>
References: <20050809012914.GA23108@bostoncoop.net>	<Pine.LNX.4.61.0508110741110.28320@yvahk01.tjqt.qr>	<20050811130700.GA15463@bostoncoop.net>	<Pine.LNX.4.61.0508112117380.23117@yvahk01.tjqt.qr>	<42FBB957.30003@rosi-kessel.org>	<42FC2D70.7000701@riverviewtech.net>	<42FC9F1B.4060204@rosi-kessel.org>	<42FD95F9.4070504@riverviewtech.net>	<20050813131224.GD25192@bostoncoop.net>	<43003B7A.4040404@riverviewtech.net>
	<4300A7C7.3080402@rosi-kessel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4300A7C7.3080402@rosi-kessel.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Okay, I understand all this. Is this all that is necessary to make sure
> the response packets go back through faketarget, though? Isn't this just
>  taking care of the first part--the "up and over/down and in" part--but
> not the second part, where packets need to go back to source through
> faketarget?

*nod*  I confess it was late and I was very tired when I wrote that email.  Yes you will need to do the corresponding in reverse, at least the up part and the unDNATing part should take care of the rest.  You will probably have to play with things a bit, but that should take care of you.



Grant. . . .

