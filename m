From: Pavlos Parissis <p_pavlos@otenet.gr>
Subject: Re: Security Advisory
Date: Thu, 9 May 2002 20:36:28 +0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020509203628.58d7eb39.p_pavlos@otenet.gr>
References: <20020508160705.T5242@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020508160705.T5242@sunbeam.de.gnumonks.org>
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
To: iptables <netfilter@lists.samba.org>

On Wed, 8 May 2002 16:07:05 +0200 Harald Welte <laforge@gnumonks.org> wrote:
> Hi!
> 
> Workarounds
>===========
> Filter out untracked local packets:
> iptables -A OUTPUT -m state -p icmp --state INVALID -j DROPUnfortunately there is a very unpopular
> announcement to be made on this

If i have default policy DROP for OUTPUT chain  am i ok,right?

Regards,
Pavlos



-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
I love having the feeling of being in control
while i have the sensation of speed

The surfer of life
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


