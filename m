From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Invalid argument on 1.4.4 w/DisableExternalCache On (Kernel
 4.7.4)
Date: Tue, 27 Sep 2016 21:11:44 +0200
Message-ID: <20160927191144.GA3280@salvia>
References: <CAMJqGp6c2SaAb=nrCaxPVVx3_yD+RvNwmxsqW3tLRGFBSFnB1w@mail.gmail.com>
 <20160921174008.GA6176@salvia>
 <CAMJqGp78RKAFSXr0E_BJDOJeYGU62_qKcT7=0LJcTTXswRNj_w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMJqGp78RKAFSXr0E_BJDOJeYGU62_qKcT7=0LJcTTXswRNj_w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Burton <lburton@mrow.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On Wed, Sep 21, 2016 at 12:02:10PM -0700, Lee Burton wrote:
> As in the subject kernel 4.7.4:
> [Wed Sep 21 02:00:15 2016] (pid=48068) [ERROR] inject-add2: Invalid argument
> Wed Sep 21 02:00:15 2016        udp      17 src=192.168.1.10
> dst=8.8.4.4 sport=57856 dport=53 [UNREPLIED]
> [Wed Sep 21 02:00:15 2016] (pid=48068) [ERROR] inject-upd1: Invalid argument
> Wed Sep 21 02:00:15 2016        udp      17 src=192.168.1.10
> dst=8.8.4.4 sport=57856 dport=53
> is an example of both.

Please, file a bug to netfilter's bugzilla, so hopefully someone can
fit this.

Thanks!
