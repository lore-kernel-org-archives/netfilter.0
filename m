From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: another quick question
Date: Mon, 20 Sep 2004 11:48:04 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <3063e5040920014819196810@mail.gmail.com>
References: <a0f69e50409200102455b0172@mail.gmail.com>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e50409200102455b0172@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

It is strongly related to the other question, same RPC/DCOM problems.


On Mon, 20 Sep 2004 14:02:57 +0600, Askar <askarali@gmail.com> wrote:
> hi again
> My second question of the day is pls first check these few rules from
> our firewall scirpt
> 
> iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -A INPUT -p UDP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -A FORWARD -p TCP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -A FORWARD -p UDP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -t nat -A PREROUTING -p TCP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -t nat -A PREROUTING -p UDP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> 
> aren't there are unnecessary repitions ? port that is Dropped in
> FOWARD chain is again Dropped in PREROUTING chain, and also why he (my
> predecssor) droping such port in INPUT table ? aren't it unnecessary,
> coz it a linux box no port 135:140 are open on our fw machine.
> 
> Today I just deletes are PREROUTING rules and now im getting counts
> for packets drops on FOWARD table.
> 
> regards
> askar
> 
> --
> (after bouncing head on desk for days trying to get mine working, I'll make
> yer life a little easier)
> 
> 



-- 
Bla bla

