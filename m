From: "Darrell Dieringer" <netfilter@darrelldieringer.com>
Subject: RE: Messaging Protocols... newbie
Date: Tue, 28 Jan 2003 09:34:49 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IMEDICLPAGAOCBLCCKLPGELMEMAA.netfilter@darrelldieringer.com>
References: <1043760613.21035.3.camel@pitbull>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1043760613.21035.3.camel@pitbull>
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
To: Shawn Duffy <pakkit@codepiranha.org>, netfilter@lists.netfilter.org

Hello,

I haven't had any problems with AIM, Y!, ICQ, or MSN though my NAT-ing
firewall.  (Don't know about ICQ - I don't have occassion to use it.)
Of course, my firewall rules allow machines in my LAN to make new
connections to the outside world.  The firewall accepts the
ESTABLISHED,RELATED traffic for those connections.

Let me ammend what I said about "not having problems"... I don't have
any problems with the _chat_ features of those systems.  I am also
able to initaite file transfers (though AIM and MSN at least), but I
am not able to receive AIM file transfers initiated by another user.

I'm sure some kind of protocol helper is needed to allow the incomming
direct connection for AIM file transfers to work, but I haven't needed
it enough to look into it.  (I know someone has posted information
about it in the last few months on this list, accompanied by a very
good description of how the AIM network operates.)

If you are writing egress filtering rules on your firewall and need to
know what traffic to accept, make sure you are logging all of your
DROP-ed packets.  Then, open up AIM / Y! / etc and immediately check
the logs.  From the dropped packets in the logs, you can decipher what
the chat client was trying to do.  Then, you can write a rule to
permit it.

Darrell Dieringer - Madison, WI


> -----Original Message-----
> My base ruleset is just about ready to go but I am having a
> hard time
> finding comprehensive rules that allow the following messaging
> protocols:
>
> AIM, Yahoo, ICQ, MSN, IRC
>


