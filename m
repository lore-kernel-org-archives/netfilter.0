From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: destination nat onto the same network
Date: Thu, 17 Jun 2004 13:46:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406171346.52719.Antony@Soft-Solutions.co.uk>
References: <40D18C2D.9030700@phreaker.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40D18C2D.9030700@phreaker.net>
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

On Thursday 17 June 2004 1:18 pm, ro0ot wrote:

> Hi all,
>
> I have one webserver inside my LAN but when I try to browse it via the
> hostname (eg. www.example.com) from a workstation inside my LAN, the
> browser can't reach the page.  Why?  From remote (outside), I can browse
> to the website.

http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-10.html

The best solution to this is to set up split DNS, so your internal clients get 
the real (private) address, and external clients get the public address, when 
resolving www.example.com.

Regards,

Antony.

-- 
Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

                                                     Please reply to the list;
                                                           please don't CC me.


