From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forwarding Help
Date: Thu, 20 Nov 2003 21:37:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311202137.hAKLbt723596@onyx.rockstone.co.uk>
References: <SEA2-DAV257n6Hj1yNr000056bb@hotmail.com> <200311202040.hAKKex723544@onyx.rockstone.co.uk> <3FBD30C6.2020905@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FBD30C6.2020905@Loudoun-Fairfax.com>
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

On Thursday 20 November 2003 9:23 pm, Jeffrey Laramie wrote:

> Antony Stone wrote:
> >
> >iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j DNAT --to
> >192.168.0.10
> >iptables -A FORWARD -d 192.168.0.1 -p tcp --dport 443 -j ACCEPT
>
> Do you mean  -d 192.168.0.10 here?  ;-)

Definitely :-)

> >PS: What does "Glacier" mean?
>
> That didn't show up in my mail. I think it has something to do with his
> html formatting.

HTML????    Ugh!!!

Antony

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac
                                                     Please reply to the list;
                                                           please don't CC me.

