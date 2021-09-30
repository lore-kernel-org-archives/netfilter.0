From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: base chains with same hook, same priority
Date: Thu, 30 Sep 2021 16:02:01 +0200
Message-ID: <YVXDWXR2oCU6sDR5@salvia>
References: <CANCV4NPRwaBeu5R4q90PeTwSgj7hD7wVhGVDAPX7rR7JHP-hvQ@mail.gmail.com>
 <CANCV4NOfOrfqeeNsQU5_Fkgn0k_FXj0paYBt2Gcz78-CJXeU2A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANCV4NOfOrfqeeNsQU5_Fkgn0k_FXj0paYBt2Gcz78-CJXeU2A@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cristian Constantin <const.crist@googlemail.com>
Cc: netfilter@vger.kernel.org

On Wed, Sep 15, 2021 at 01:44:47PM +0200, Cristian Constantin wrote:
> cristian: one interesting side-effect...
> 
> after having two chains with the same hook, priority in the same table
> (as above), `iptables` cmd line tool reports the respective table as
> incompatible...
> 
> # /usr/sbin/iptables -t filter -S --wait
> iptables v1.8.5 (nf_tables): table `filter' is incompatible, use 'nft' tool.
> 
> # iptables -L
> iptables v1.8.5 (nf_tables): table `filter' is incompatible, use 'nft' tool.

IIRC interaction between iptables-nft and nft has got better over the
recent version (latest is v1.8.7), and there are also recent patches
to improve it more.
