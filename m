From: Ambroz Bizjak <ambrop7@gmail.com>
Subject: Re: NCD, a light scripting language for network configs and much more
Date: Fri, 17 Aug 2012 21:16:54 +0200
Message-ID: <CAOA3yKKUANXu37eph1ohAUSrrJGd-fAQvi2qsz5CphKn7gMvXw@mail.gmail.com>
References: <CAOA3yKKmuAi=CPE=4-hyoGJJ7D7Oa_Bug5G=1Z3xif-5iFGeOw@mail.gmail.com>
	<20120817092253.41ade51b@nehalam.linuxnetplumber.net>
	<CAOA3yKLQNQ-t4VGENKTH683eLXA3A8GwPJ1w7zwT=AUus_CkFw@mail.gmail.com>
	<20120817120702.62103ae4@nehalam.linuxnetplumber.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=yjuANEfB/KYLFSxEAjcVKMMMjyFCJYQkzPZ6wh0+nFQ=;
        b=nWSN6A1wzTOJh2KM7azWwyh23HxxiCcM+uhgIhvpcgyD6w4WBab7t9q3blON5gaoPj
         4YvJmNhcuQxITcnr4ggzd0bZVncRhDuIH04CHYN3R0lHlwnPwaBjbq7kNIG57wUq48Se
         N020SuSnGvlLqAF8fM7Y7dVsfRNKVENy/0p0T+1bjHZjwfaPwFMnF5uDD4DQim6j4uA8
         HhHgmkqcjMHasnqAMDUVpABa9TpESRXgyWGlTxpmEDX4B9rOAeQizslmngmsSDrgWC1d
         Cnmr6EpH+CPRkU/njq6o+omdO7iSoe2RpQS4E5VvV7DHLgUpi2evI6aUFpQCrkaNmUOi
         Hvtw==
In-Reply-To: <20120817120702.62103ae4@nehalam.linuxnetplumber.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <shemminger@vyatta.com>
Cc: netfilter@vger.kernel.org

I see, thanks, it's even mentioned in the ip-link manpage. I think it
would be nice if it was a little less hidden though. I would never
guess "set master" is how you add a device to a bridge. Still, it's
good all the network config stuff is getting into a single command.

On Fri, Aug 17, 2012 at 9:07 PM, Stephen Hemminger
<shemminger@vyatta.com> wrote:
> You can make a bridge with:
>  # ip link add br3 type bridge
>
> and delete with
>  # ip link del br3
>
> To add device to bridge
>  # ip li set dev eth2 master br3
>
> To take out of bridge
>  # ip li set dev eth2 nomaster
>
> The point is that bridge isn't special.
