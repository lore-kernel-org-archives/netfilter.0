From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: logs
Date: Fri, 9 Apr 2004 18:26:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404091826.45635.JALaramie@Loudoun-Fairfax.com>
References: <BAY15-F33bYKb2X5YqE00065cb9@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F33bYKb2X5YqE00065cb9@hotmail.com>
Content-Disposition: inline
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

On Friday 09 April 2004 18:07, azeem ahmad wrote:
> hi alll
> i want to check the logs of iptables to check who is passing throught my
> machine. so plz tell me where r its logs and how can i check them
> regards
> Azeem

Iptables uses syslog which writes to /var/log/messages file by default.

Jeff

