From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: iptables TRACE not logged
Date: Sun, 13 Sep 2015 13:50:16 +0200
Message-ID: <20150913115016.GD3691@salvia>
References: <CABLYT9hQERBkQWskobkKb8tJ64is48e8_4joAYivjo4a+_e+GA@mail.gmail.com>
 <20150911122803.GA5460@salvia>
 <CABLYT9i-i5oaXkAmeVSXGbsob5kfcX5RQM8xktzAj7f273BriQ@mail.gmail.com>
 <20150911153751.GA3581@salvia>
 <CABLYT9gFA=khGxc6aFkDkBuoacKi_cB2Awv0h7WQXUpJ8MEC1g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABLYT9gFA=khGxc6aFkDkBuoacKi_cB2Awv0h7WQXUpJ8MEC1g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vieri Di Paola <vieridipaola@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, Sep 13, 2015 at 12:13:41AM +0200, Vieri Di Paola wrote:
> Thanks Pablo.
> This worked:
> sysctl net.netfilter.nf_log.2=nf_log_ipv4
> Now I'm getting TRACE messages in system log.

BTW, this used to work with ipt_LOG, right?

Thanks!
