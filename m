From: Askar <askarali@gmail.com>
Subject: Re: yahoo webcam
Date: Mon, 22 Nov 2004 22:38:02 +0500
Message-ID: <a0f69e504112209384401445d@mail.gmail.com>
References: <006401c4d0d9$04ef2a80$6339a8c0@amidala>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006401c4d0d9$04ef2a80$6339a8c0@amidala>
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
To: "Sandy T. Santos" <sandy@bulacan.gov.ph>
Cc: netfilter@lists.netfilter.org

try this rule

$iptables -A FORWARD -o ppp0 -p tcp -m multiport --dport
5000,5001,5100,5050,11999 -m state --state NEW -j ACCEPT

its for yahoo yahoo service chat, cam, voice, games

regards

On Tue, 23 Nov 2004 05:19:57 +0800, Sandy T. Santos
<sandy@bulacan.gov.ph> wrote:
> i have a problem enabling yahoo webcam on a NAT'ed
> drop-all-unless-specified firewalled box. currently the ym clients (all on
> win32's) can only access yahoo messenger via squid transparent proxy but
> this does not allow webcam to work. the requirements for yahoo webcam is
> that you have to open up TCP port 5100, i have done that but i still can't
> established a connection with the ym server. i was wondering if anyone here
> knows the complete rule for making this work.
> 
> thanks.
> 
> ``
> Sandy T. Santos
> Provincial Information Technology Office
> Provincial Government of Bulacan | http://www.bulacan.gov.ph
> Malolos, Bulacan
> Registered Linux User #345287
> 
> 


-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

