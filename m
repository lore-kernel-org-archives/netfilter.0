From: Paul <gabaod@yahoo.com>
Subject: Re: portforwarding
Date: Mon, 5 May 2003 16:58:41 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030505235841.81529.qmail@web13502.mail.yahoo.com>
References: <3EB6F495.7090900@gmx.ch>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EB6F495.7090900@gmx.ch>
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
Content-Transfer-Encoding: 7bit
To: Eric Marchionni <mailing-lists@gmx.ch>, netfilter@lists.netfilter.org

well make sure apache is first installed correctly and
loads up just fine..  Try doing an  apache -S  to make
sure it loads fine

secondly theres 2 things needing to be done

first need to forward the port

iptables -t nat -A PREROUTING -d externalip -p tcp
--dport 80 -j DNAT --to webserverip:80

and also make sure the port you want is opened in your
FORWARD as well

iptables -A FORWARD -p tcp --dport 80 -j ACCEPT


will prob have to change around those cmds a lil bit
to suit your needs, but hopefully that gets you on the
right track.

-paul

--- Eric Marchionni <mailing-lists@gmx.ch> wrote:
> hi list
> 
> my buddie is trying to get his webserver working
> behind his 
> debian router.
> this is what i gave him (we tried once with --dport
> and once with 
> --dports):
> 
> iptables -t nat -A PREROUTING -i $WAN_IFACE -p tcp
> -m multiport 
> --dports 22,80 -j DNAT --to-destination $SERVER
> 
> i'm not able to connect to his webserver with
> http://his_ip/
> what am i doing false? got any ideas?
> 
> thanx
> eric
> 
> 


__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com

