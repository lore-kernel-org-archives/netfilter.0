From: "Victor Yeo" <yeosv@ndc.com.tw>
Subject: Re: rules for skype
Date: Tue, 3 May 2005 15:17:41 +0800
Message-ID: <002401c54fb0$33cdc950$2604a8c0@ndchunk>
References: <20050502150901.DAEF39E9F4@dd6816.kasserver.com><42764919.60507@lopsch.com><42764E36.7080300@riverviewtech.net>
	<BAY107-DAV7808D3CABD608123BCF2CB7270@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Deepak Seshadri <d_s123@hotmail.com>, netfilter@lists.netfilter.org

> - Use *tc* to choke the skype traffic. I have a list of apps to allow
> through the network. The rest go into a default pipe of 2 Kbps. This
> deteriorates the performance of the application. I think text chatting
will
> still go through but voice chatting, file sharing and all gets choked.
> NOTE: I have had better success not blocking its default ports. That way I
> can keep it away from the standard Internet ports and thus easily classify
> it into the default pipe.

Where can i find more information on *tc* ? thanks for any reply.

Rgds,
Victor

----- Original Message ----- 
From: "Deepak Seshadri" <d_s123@hotmail.com>
To: "Taylor, Grant" <gtaylor@riverviewtech.net>;
<netfilter@lists.netfilter.org>
Sent: Tuesday, May 03, 2005 1:01 AM
Subject: Re: rules for skype


> Hi Grant,
>
> My company requires me to block Skype too. There are 3 ways I have found
> after a lot of research:
>
> - Block the authentication servers' IPs. The last I knew there were only 2
> servers for authentication. Their IPs are given in that pdf document. I am
> not aware if they have added new servers now.
> - Use Layer-7 pattern. Again, the layer-7 pattern has worked for some and
> not worked for many. It has worked for me.
> My network scenario: The network I manage has private addresses
throughout.
> I think it has something to do with NAT and private addressing because in
my
> case when the client tries to authenticate with the server the hex-pattern
> of those UDP packets stays the same throughout every session. This has not
> been true in every case. You can give it a shot.
> - Use *tc* to choke the skype traffic. I have a list of apps to allow
> through the network. The rest go into a default pipe of 2 Kbps. This
> deteriorates the performance of the application. I think text chatting
will
> still go through but voice chatting, file sharing and all gets choked.
> NOTE: I have had better success not blocking its default ports. That way I
> can keep it away from the standard Internet ports and thus easily classify
> it into the default pipe.
>
> Now given the nature of this application, some things might work for you
and
> some might not. I thought I would share my knowledge on this ....
>
> Good luck,
> Deepak
>



