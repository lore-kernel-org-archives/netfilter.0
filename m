From: Max Headroom <maxheadroom2323@yahoo.com>
Subject: Re: Real Player Helper in 2.4
Date: Tue, 11 Jun 2002 09:59:02 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020611165902.83784.qmail@web10606.mail.yahoo.com>
References: <Pine.LNX.4.44.0206101844280.19464-100000@firefox.malibyte.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.44.0206101844280.19464-100000@firefox.malibyte.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Sully <rcs@malibyte.net>
Cc: netfilter@lists.samba.org

Bob,
Thanks. But, TCP doesn't need a NAT helper
because only UDP uses an anonymous port
that the server needs to connect back to
the client on. The argument is that UDP
give better performace which is why
I am trying to get a 2.4 NAT helper for
Real Player. Anyone know of anyone else
working on the problem? ICQ would is another
helper I am looking for. Anyone working on
that?
MH


--- Bob Sully <rcs@malibyte.net> wrote:
> 
> Max (that's great, nearly forgot about that
> commercial!)
> 
> I use this in my script to allow the RealVideo
> client; the RealAudio 
> just seems to work without any special rules:
> 
> if [ $RV_CLIENT -gt 0 ]; then
>    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p TCP
> --sport \ 
>    $UNPRIVPORTS --dport 554 -s $EXTERNAL_IP -d
> $ANYWHERE -j ACCEPT
> 
>    iptables -A INPUT -i $EXTERNAL_INTERFACE -p TCP
> --sport 554 \ 
>    -s $ANYWHERE -d $EXTERNAL_IP -j ACCEPT
> 
>    if [ $MASQUERADING -gt 0 ]; then 
>       iptables -A FORWARD -p TCP -s
> $INTERNAL_NETWORK --sport \ 
>       $UNPRIVPORTS --dport 544 -j ACCEPT
>       iptables -A FORWARD -m state --state
> ESTABLISHED,RELATED \
>       -p TCP -d $INTERNAL_NETWORK --sport 544
> --dport $UNPRIVPORTS \ 
>       -j ACCEPT
>    fi
>    if [ $VERBOSE -gt 0 ]; then
>       echo "firewall: Real Video client enabled"
>    fi
> fi
> 
> HTH -- Bob
> 
> On Mon, 10 Jun 2002, Max Headroom wrote:
> 
> > I am interested in getting information about
> > the NAT helper for Real Player in the 2.4
> > kernel. There is a NAT helper in the 2.2 kernel
> > but no one seems to be working on it.
> > Does anyone know where I could get information
> > about the Real Play NAT helper support
> > in the 2.4 kernel? Who is working on it?
> > 
> > MH
> > 
> > __________________________________________________
> > Do You Yahoo!?
> > Yahoo! - Official partner of 2002 FIFA World Cup
> > http://fifaworldcup.yahoo.com
> > 
> 
> -- 
> ________________________________________
> Bob Sully - Simi Valley, California, USA
> http://www.malibyte.net
> 
> "The weather is here - wish you were beautiful." -
> J. Buffett
> 
> 


__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com

