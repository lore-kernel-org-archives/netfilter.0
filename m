From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: tcpwrappers as firewall and/or CL-GW
Date: Sun, 11 Apr 2004 16:12:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404111612.32834.Antony@Soft-Solutions.co.uk>
References: <6934.1081694597@zworg.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6934.1081694597@zworg.com>
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

On Sunday 11 April 2004 3:43 pm, __ Radien__ wrote:

> >> Sure, Thx. Can u take some example of existing Circuit Level Gateways?
> >
> >Socks is the usually-quoted example.
>
> How about tcpwrappers, are they some kind of Circuit Lavel Gateway?
> (e.g. xinetd)

No.   TCPwrappers is a response mechanism to see where a connection came from, 
not a gateway in the middle of a connection between two machines.

Regards,

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.


