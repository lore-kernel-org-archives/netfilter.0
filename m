From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT not working
Date: Thu, 18 Mar 2004 21:58:34 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403182158.34121.Antony@Soft-Solutions.co.uk>
References: <000101c40d27$5ce6ed20$0464a8c0@stu> <1079642989.2006.35.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079642989.2006.35.camel@localhost>
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

On Thursday 18 March 2004 8:49 pm, John A. Sullivan III wrote:

> On Thu, 2004-03-18 at 15:26, Stuart Lamble wrote:
> > Hello netfilter lists
> >
> > Can any one help me here. I have the following rule...
> >
> > iptables -t nat -A PREROUTING -i ppp0 -p tcp -d $FW-EXT-IP --dport 22
> > -j DNAT --to 192.168.100.6:22
>
> Perhaps you were just saving typing but isn't the correct syntax -j DNAT
> --to-destination 192.168.100.6:22

Both are valid.

The DNAT target takes --to-destination or --to as its argument; similarly the 
SNAT target happily takes --to-source or --to as its argument.

Regards,

Antony.

-- 
What makes you think I know what I'm talking about?
I just have more O'Reilly books than most people.

                                                     Please reply to the list;
                                                           please don't CC me.


