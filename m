From: Julien Vehent <julien@linuxwall.info>
Subject: Re: traffic shaping documentation
Date: Tue, 21 Apr 2009 13:18:12 +0200
Message-ID: <154d9336a3c358635883b5c3972a149b@localhost>
References: <49ED88BD.4070406@lab.vectoris.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49ED88BD.4070406@lab.vectoris.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Mihamina Rakotomandimby (R12y)" <mihamina@lab.vectoris.fr>
Cc: netfilter@vger.kernel.org

Hello,

By your signature, I suppose you read french. Then, maybe you will find
some useful information in the doc I wrote a few months ago :
http://wiki.linuxwall.info/doku.php?id=ressources:dossiers:advanced_networking:2_qos_traffic_control

Hope it helps...

Julien

On Tue, 21 Apr 2009 11:50:05 +0300, "Mihamina Rakotomandimby (R12y)"
<mihamina@lab.vectoris.fr> wrote:
> Hi all,
> I have a gateway on which I would like to implement traffic shapping
based 
> only on ports.
> The simple schema:
> 
>      15-PCs-LAN <-> (eth0)[Gateway](eth1) <-> Internet
> 
> The gateway is also my workstation and it holds many services accessibles

> from the LAN and from Internet.
> 
> The problem is HTTP traffic is so much that SSH connection to the remote 
> servers I manage are slow.
> 
> Therefore, I would like to give:
> - highest priority to SSH (INPUT/OUTPUT/FORWARD dport 22)
> - normal priority to others (INPUT/OUTPUT/FORWARD dport:FTP, SVN,...)
> - lowest priority to HTTP
>    (dport 80 REDIRECTed INPUT on squid's 3128, OUTPUT dport 80)
> 
> The perfect would be to shape it on the OUTPUT chain, because I would
like 
> also the shape affects my (Gateway) behaviour.
> 
> I am not asking for the direct solution, I am first asking if what I
want:
>   - is a good idea
>   - implementable
>   - is documented in another place than lartc.org
>     (which is good but too much big for my simple needs)
> 
> Thank you for any tips.

-- 
julien
http://jve.linuxwall.info/blog
