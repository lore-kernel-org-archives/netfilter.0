From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: logging -- a newbie question
Date: Fri, 07 May 2004 09:19:56 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409B9B0C.8090207@pbl.ca>
References: <20040507133419.GA32666@bofh.rus.uni-stuttgart.de> <200405071445.38711.Antony@Soft-Solutions.co.uk> <20040507140437.GB32666@bofh.rus.uni-stuttgart.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040507140437.GB32666@bofh.rus.uni-stuttgart.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pawel Mueller <rusatlan@bofh.rus.uni-stuttgart.de>
Cc: netfilter@lists.netfilter.org

Pawel Mueller wrote:
> I didn't meant the LOG target. There must be a file where all
> connections are listed. I know, because I saw it once. But it was a half
> year ago, so I can't remember. I know I read it in a howto. It was one
> that described, how you can debuge a firewall and it mentioned a file,
> where you can see the hole ACK, SYN and ESTABLISHED or DROPED stuff for
> each package (I think) that passes the firewall.

AFAIK, no such thing.  "netstat -a" will show you states of current 
connections to/from local machine.  tcpdump is your friend while 
debugging firewalls.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

