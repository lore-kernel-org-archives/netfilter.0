From: Jiann-Ming Su <sujiannming@gmail.com>
Subject: Re: UDP atack
Date: Wed, 29 Dec 2004 21:20:07 -0500
Message-ID: <561dc326041229182018890329@mail.gmail.com>
References: <1139dfe2041229172142fefdd@mail.gmail.com>
Reply-To: Jiann-Ming Su <sujiannming@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1139dfe2041229172142fefdd@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 29 Dec 2004 23:21:19 -0200, Bruno Wallace
<bruno.wallace@gmail.com> wrote:
> Hello
> did you saw this type of attack?
> 
> tcpdump
> 22:42:00.565519 83.102.166.7 > 200.123.456.789: udp (frag 53995:25@512)
> 22:42:20.174143 83.102.166.7 > 200.123.456.789: udp (frag 34877:25@512)
> 22:44:45.756888 83.102.166.7 > 200.123.456.789: udp (frag 46589:25@512)
> 22:46:40.741492 83.102.166.7 > 200.123.456.789 udp (frag 4052:25@512)
> 22:47:02.074045 83.102.166.7 > 200.123.456.789: udp (frag 17141:25@512

Are you sure it's not gaming traffic?

-- 
Jiann-Ming Su
"I have to decide between two equally frightening options. 
 If I wanted to do that, I'd vote." --Duckman

