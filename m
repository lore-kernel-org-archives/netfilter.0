From: Bob Sully <rcs@malibyte.net>
Subject: Re: Propert IPTABLES Configuration
Date: Fri, 6 Dec 2002 22:24:26 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0212062220210.30331-100000@firefox.malibyte.net>
References: <20021207053208.86183.qmail@web14503.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021207053208.86183.qmail@web14503.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "james.Q.L" <shijialeeee@yahoo.ca>
Cc: netfilter@lists.netfilter.org



Hey guys...I used to run a CS server on one of my machines.  This worked 
for me:

        # GAMES
        # Half-Life/CounterStrike
        #

        if [ $HALF_LIFE -gt 0 ]; then

            iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p UDP \
        --sport 27000:27050 --dport $UNPRIVPORTS -s $EXTERNAL_IP -d \
        $ANYWHERE -j ACCEPT

            iptables -A INPUT -i $EXTERNAL_INTERFACE -p UDP \
        --sport $UNPRIVPORTS --dport 27000:27050 -s $ANYWHERE -d \
        $EXTERNAL_IP -j ACCEPT

            if [ $VERBOSE -gt 0 ]; then
                echo "firewall: Half-Life/CounterStrike ports enabled"
            fi

        fi

where:

$EXTERNAL_INTERFACE = eth0 in my case
$EXTERNAL_IP = obvious
$UNPRIVPORTS = 1024:65535
$ANYWHERE = any/0

HTH -- Bob


On Sat, 7 Dec 2002, james.Q.L wrote:

>  --- Rob <netfilter@cloudtown.com> wrote: > I am attempting to setup a Half-Life Counter-Strike
> Server on my 
> > machine.  I need
> > it setup so people can access it from the internet and my intranet.
> > 
> > I found the following ports I need setup.
> > 
> > TCP 6003 outbound, incoming replies (as specified in woncomm.lst)
> > TCP 7002 outbound, incoming replies (as specified in woncomm.lst)
> > UDP 27010 outbound, incoming replies (as specified in woncomm.lst)
> > UDP 27011 outbound, incoming replies (as specified in woncomm.lst)
> > UDP 27012 outbound, incoming replies (as specified in woncomm.lst)
> > UDP 27013 outbound, incoming replies
> > UDP 27015 outbound, incoming replies on 27015-27050
> 
> i remember that 6003, 7001, 7002 are used for authentication and server lists.
> so if you want only invite ppl join. maybe it's fine just open 27015 port.
> someone correct me if i am wrong.
>  
> > 
> > would something like this be right?
> > 
> > IPTABLES -A INPUT -i eth0 -p tcp -s any/0 -d any/0 --dport 6003 -m state 
> > --state ESTABLISHED,RELATED -j ACCEPT
> 
> this will reject you friends who want to join the server by typing the ip in the game console.
> 
> > with that in mind would I have to create an output for each one too?
> > 
> > IPTABLES -A OUTPUT -o eth0 -p tcp --dport 6003 -m state --state 
> > NEW,ESTABLISHED,RELATED -j ACCEPT
> 
> using NEW,ESTABLISHED,RELATED is the same as just saying "-j ACCEPT"
> i think you want to allow "ESTABLISHED,RELATED " out.
> 
> IPTABLES -A OUTPUT -o eth0 -p tcp --dport 6003 -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> > Thanks for your help.
> > 
> > Rob

-- 
________________________________________
Bob Sully - Simi Valley, California, USA
http://www.malibyte.net

"The weather is here - wish you were beautiful." - J. Buffett



