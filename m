From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: Propert IPTABLES Configuration
Date: Sat, 07 Dec 2002 12:57:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF1E228.60804@karlsbakk.net>
References: <Pine.LNX.4.44.0212062220210.30331-100000@firefox.malibyte.net>
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
To: Bob Sully <rcs@malibyte.net>
Cc: "james.Q.L" <shijialeeee@yahoo.ca>, netfilter@lists.netfilter.org

Bob Sully wrote:

>Hey guys...I used to run a CS server on one of my machines.  This worked 
>for me:
>
>        # GAMES
>        # Half-Life/CounterStrike
>        #
>
>        if [ $HALF_LIFE -gt 0 ]; then
>
>            iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p UDP \
>        --sport 27000:27050 --dport $UNPRIVPORTS -s $EXTERNAL_IP -d \
>        $ANYWHERE -j ACCEPT
>
>            iptables -A INPUT -i $EXTERNAL_INTERFACE -p UDP \
>        --sport $UNPRIVPORTS --dport 27000:27050 -s $ANYWHERE -d \
>        $EXTERNAL_IP -j ACCEPT
>
>            if [ $VERBOSE -gt 0 ]; then
>                echo "firewall: Half-Life/CounterStrike ports enabled"
>            fi
>
>        fi
>
>where:
>
>$EXTERNAL_INTERFACE = eth0 in my case
>$EXTERNAL_IP = obvious
>$UNPRIVPORTS = 1024:65535
>$ANYWHERE = any/0
>  
>
sure, but you'd better use -m state --state RELATED,ESTABLISHED[,NEW]? 
instead of
--sport $UNPRIVPORTS, as the former is stateful.

roy





