From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: LAN accessing DMZ
Date: Sun, 18 Jul 2004 20:12:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407182012.13539.Antony@Soft-Solutions.co.uk>
References: <f51b72bc040718062373640612@mail.gmail.com> <200407181859.47417.Antony@Soft-Solutions.co.uk> <20040718185129.GA679@tranquility.scriptkitchen.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040718185129.GA679@tranquility.scriptkitchen.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sunday 18 July 2004 7:51 pm, Payal Rathod wrote:

> On Sun, Jul 18, 2004 at 06:59:47PM +0100, Antony Stone wrote:
> >
> > I do not understand how you can connect through this ruleset to TCP port
> > 10000
>
> I have squid on this machine. Is it because of that?
> Is it passing thru' squid cos' I enter in my browser
> https://10.10.10.2:10000

Yes.   A web proxy running on the same machine means that the INPUT and OUTPUT 
rules apply, not the FORWARD rules.

Antony.

-- 
"There is no reason for any individual to have a computer in their home."

 - Ken Olsen, President of Digital Equipment Corporation (DEC, later consumed 
by Compaq, later merged with HP)

                                                     Please reply to the list;
                                                           please don't CC me.


