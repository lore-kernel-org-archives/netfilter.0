From: Ken-ichirou MATSUZAWA <chamaken@gmail.com>
Subject: Re: Confusion regarding nfct_query and nfct_callback_register
Date: Fri, 12 Feb 2016 16:30:32 +0900
Message-ID: <20160212073032.GA320@gmail.com>
References: <CAKJ7aR5QqKWJadptNGrUruWX9JQm3C97bhHqvHY3AR11HXXHyQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=CfYj8Mii3jq8hUuUiokbEAT/NIG7VaOzhZWf0WtAz6M=;
        b=MT7zcUtfHZuxjYr0Qt37pTszc3SPqNTwSBkQpx6pg5+sSBPBbWkkpAGiVNjtaoHo3l
         YoqNGwOXcz1PEcU2E7tWpdqwdgoRC30zBvQlPA2dfUI6yWdviqTM1HcYBav5tjzLwg1Z
         MYnxWQCYbgLupNMAnqqaSA4+29cC7AYkHSQbp+PUoHInvkl25SBga4vgbWFUMo4WpNBW
         +kT3U0d71vqLUuH3+6eycBWvvTJ8nwOSYC7BUMTqGKh5SOJ5vdWHO01n9j3VVNmn6r6C
         e9b8ZXYsutsZy4foJnZCEPyCZsyzrAAf+hvx0OxWWEhxU/V44+jeRgHU1navo/cwzAb8
         SFJg==
Content-Disposition: inline
In-Reply-To: <CAKJ7aR5QqKWJadptNGrUruWX9JQm3C97bhHqvHY3AR11HXXHyQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gadre Nayan <gadrenayan@gmail.com>
Cc: netfilter@vger.kernel.org

 Hi,
 
On Fri, Feb 12, 2016 at 09:40:49AM +0530, Gadre Nayan wrote:
> Who is providing both these structures (struct nf_conntrack *ct, void

struct nf_conntrack is allocated by nfct_new(). You would find this
function called in __callback() in src/callback.c. Then it parses
nlmsg and updates nf_conntrack, calls callback function you
registered.

The __callback() is registerd as callback of which libnfnetlink will
call when conntrack nlmsg has received, at nfct_callback_register()
in src/conntrack/api.c.

# it seems that using nfct_callback_register, functions related to
# libnfnetlink, is discouraged for me.

I hope this is an answer you are looking for.
Thanks,
