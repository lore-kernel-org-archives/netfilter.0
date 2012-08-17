From: Ambroz Bizjak <ambrop7@gmail.com>
Subject: Re: NCD, a light scripting language for network configs and much more
Date: Fri, 17 Aug 2012 21:04:04 +0200
Message-ID: <CAOA3yKLQNQ-t4VGENKTH683eLXA3A8GwPJ1w7zwT=AUus_CkFw@mail.gmail.com>
References: <CAOA3yKKmuAi=CPE=4-hyoGJJ7D7Oa_Bug5G=1Z3xif-5iFGeOw@mail.gmail.com>
	<20120817092253.41ade51b@nehalam.linuxnetplumber.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=wwOnkIQLEUBaV5oHPtJawRJhEedvBAJxVo9vdJbzgNU=;
        b=SZwIw8r5h9+n9oGPR2Js1hZUNUsgEVo9vwsscglS4oPRj8BV4f/EYWrbTs1lYqg5Jh
         uagy0VXUSfuF9U4LA+lBCbftI/ziFa9H/kTgMvmf9fpZha+R0Nf5EOJ1reLyQxe3HvPA
         6Cdrox0SBnenz2w6ADtgydPisyvI4OUUJSqqC3bnnOMZSDRrQb79PN0BSybO+N6BdLdO
         ZTw+LFK9ri757TFxUTAm8oBSruKbu1r5KZsf5bGyCi8NsMFo0EKx/aU5BLijkBa84GTj
         LX9eY6Xdw9kprOs+KGE/n9x6Pasj75n63i9O28+zDWfaR9ktUt6Il+U8N62UP/oANAfj
         GlEg==
In-Reply-To: <20120817092253.41ade51b@nehalam.linuxnetplumber.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <shemminger@vyatta.com>, netfilter@vger.kernel.org

Huh, really? I can't seem to find those commands. I only see a
"bridge" program added to iproute2 which does "forwarding database
management", and doesn't seem to have the usual addbr/addif commands.
Anyway, if brctl did suddenly disappear, imagine how easier it would
be to fix that script I showed you compared to fixing something
hardcoded like NetworkManager :)

On Fri, Aug 17, 2012 at 6:22 PM, Stephen Hemminger
<shemminger@vyatta.com> wrote:
>
> FYI - you can use ip commands now to control bridge.
> For all the new features planned, they won't be controllable via brctl.
