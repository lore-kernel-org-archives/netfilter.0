From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forwarding on the same NIC
Date: Mon, 10 May 2004 21:15:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405102115.14089.Antony@Soft-Solutions.co.uk>
References: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105>
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

On Monday 10 May 2004 8:36 pm, alucard@kanux.com wrote:

> Hi there...
>
>    I have been using netfilter for a while and now, I have to integrate
> some other servers and somehow I can't get it to forward packets.

Change:

> iptables -A FORWARD -i eth0 -p tcp --dport 8080 -j ACCEPT

Into:

iptables -A FORWARD -i eth0 -p tcp --dport 80 -j ACCEPT

Remember that PREROUTING (where you are changing the port number) happens 
before FORWARD.

Regards,

Antony.

-- 
I don't know, maybe if we all waited then cosmic rays would write all our 
software for us. Of course it might take a while.

 - Ron Minnich, Los Alamos National Laboratory

                                                     Please reply to the list;
                                                           please don't CC me.


