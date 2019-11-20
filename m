From: zrm <zrm@trustiosity.com>
Subject: Re: One more application available for nftables
Date: Wed, 20 Nov 2019 11:41:34 -0500
Message-ID: <372da802-bc2e-a055-6ece-3c765c38ee00@trustiosity.com>
References: <b99d882d69f5e152919339c65ac26163@mailtower.de>
 <b5512a97bad28c14e57ebf2f92c12f27@mailtower.de> <87v9rhdhuz.fsf@goll.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trustiosity.com;
        s=mx; t=1574268097; bh=ISMGYuEfxMNxYLJcncDUPIAc7GzaS5HhEqtu0eCUecc=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=DzNNO3dMll0bbErYYoWawu0tvHW31fMkzlbu9485phySda6AY+0GiyqRXmx56uHiA
         lseZo17oq4vn0RtEdtxtlmsOq1V/qwJJmi58uKLzaVPh6pmAe4ST3ldQhRpmJk7gmd
         CKj82l1XqF/gV4FtMLiiysks6ykCwE4LrL/vBQ6o=
In-Reply-To: <87v9rhdhuz.fsf@goll.lan>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Trent W. Buck" <trentbuck@gmail.com>, netfilter@vger.kernel.org


On 11/17/19 21:43, Trent W. Buck wrote:

> I see you're matching vsftpd.  I very very strongly recommend
> you... encourage your end users to switch from FTP to SFTP.  :-)
> (Many (most?) Windows FTP clients can do SFTP these days.)
> 

It's always fun to see the systems people and the network people argue 
over this.

Everybody should obviously discontinue using plaintext FTP, but FTPS 
(i.e. FTP over TLS) is a thing that exists, and is generally a much 
smaller configuration change for an existing FTP service than switching 
to SFTP (i.e. the SFTP subsystem of the SSH protocol).

Using SFTP also admits a lot of protocol features that you Do Not Want 
if all you're after is file transfers. Configure it a bit wrong and your 
users get a shell, the ability to forward ports from the public address 
of your SFTP server to their client, the ability to forward ports from 
their client to whatever internal hosts they want on the same internal 
network as your SFTP server, a VPN, X11 forwarding etc.

By contrast, the disadvantage of FTPS is that it uses separate control 
and data connections, and because it's encrypted, the firewall can't 
snoop the control connection to see which ports it will use for the data 
connection. So the only way to really make it work is to allow clients 
to make outgoing connections to arbitrary unprivileged ports. Then you 
have to convince the client's network administrator to allow that.

But the alternative is to allow outgoing connections to the SSH port. 
Which, because it's opaque and supports port forwarding and VPN and so 
on, effectively allows the same thing anyway.
