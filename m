From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: What to do to protet our send from the attacks which is caused
 by	worms?
Date: Fri, 17 Sep 2004 14:20:57 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <414B3919.90503@pbl.ca>
References: <BAY12-F11jlA733LJa500009c09@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY12-F11jlA733LJa500009c09@hotmail.com>
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

Red Hat wrote:
> Hi,
> 
> What to do to protet our send from the attacks which is caused by worms in
> Microsoft XP OS of our users? Our user may have worms in their system & it
> causes that our send go up & up that our send is going upper than which we
> have to use.

How about installing all updates from MS, and putting some anti-virus on 
your mail server, so that your users don't get infected in the first place?

Other than that, on the firewall close everything down, and allow only 
what you need (no direct outgoing connections from user's computers, no 
direct incoming connections to user's computers, only incomming/outgoing 
to/from servers in DMZ).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

