From: Damjan <gdamjan@mail.net.mk>
Subject: Re: connrate
Date: Tue, 22 Aug 2006 02:26:32 +0200
Message-ID: <20060822002632.GA22161@legolas.on.net.mk>
References: <20060821220137.GB26225@boogeyman>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20060821220137.GB26225@boogeyman>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

> I've divided my traffic into three queues going by the TOS on packets.  I set
> them with iptables based on ports and split them into interactive traffic,
> less important traffic, and bulk traffic (which has a bandwidth limit via htb).
> 
> The problem in question is with ssh and scp.  Both forms of traffic go to port
> 22.  I want to preserve the interactivity of ssh and throw scp traffic into the
> bulk traffic queue.

I *thought* that OpenSSH would set the TOS bit differently on interactive SSH
sessions and on file transfer sessions? Have you tried it? 


-- 
damjan | дамјан
This is my jabber ID -->         damjan@bagra.net.mk 
 -- not my mail address, it's a Jabber ID --^ :)

