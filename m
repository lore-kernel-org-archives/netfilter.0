From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: REDIRECT to multiple ports
Date: Thu, 30 Sep 2004 09:33:08 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <415C1924.2020100@pbl.ca>
References: <00f501c4a664$592083a0$f90e0e0a@msojsi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00f501c4a664$592083a0$f90e0e0a@msojsi>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Shpend Bakalli wrote:
> I have a transparent squid proxy with 3 running squid processes in it (to make use of mltiprocessor architecture). Each have different ports.
> I'm using REDIRECT to redirect packets comming with destination port 80 to ports 3127 - 3129 in the proxy server.
> Although the distribution of the requests should be done in a round-robin fashion, it seems it is not done like that.
> Any idea how kernel/iptables manages this kind of redirection? Is it a simple round-robin or there is some other method of distribution?

Not really Netfilter related, but, why do you need multiple Squid 
processes to make use of multiprocessor architecture?  Squid will spawn 
child processes by itself and assign incomming requests to them in round 
robin fashion.  Unless you have a huge number of incomming requests per 
second, this shouldn't be a problem.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

