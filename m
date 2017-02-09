From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: R: Bridge
Date: Thu, 9 Feb 2017 11:57:49 +0100
Message-ID: <20170209105749.GA2149@salvia>
References: <008c01d28229$87da0cd0$978e2670$@certimeter.it>
 <001001d282be$beec73d0$3cc55b70$@certimeter.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <001001d282be$beec73d0$3cc55b70$@certimeter.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mario Leone <mario.leone@certimeter.it>
Cc: netfilter@vger.kernel.org

On Thu, Feb 09, 2017 at 11:24:49AM +0100, Mario Leone wrote:
> As said here: http://ebtables.netfilter.org/documentation/bridge-nf.html
> 
> bridge-nf-call-arptables
> bridge-nf-call-iptables
> bridge-nf-call-ip6tables
> 
> are enabled by default
> 
> echo 1 > bridge-nf-filter-vlan-tagged
> does nothing
> 
> echo 1> bridge-nf-filter-pppoe-tagged
> drops the connection

What kernel and userspace tooling versions are you using?
