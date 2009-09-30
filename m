From: Hannes Eder <heder@google.com>
Subject: Re: [PATCH] conntrack: do not print garbage after the usage message
Date: Wed, 30 Sep 2009 15:27:00 +0200
Message-ID: <4AC35CA4.6090303@google.com>
References: <20090930130142.16484.76529.stgit@jazzy.zrh.corp.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1254317236; bh=LVVc14RcgGObB+ZgS45OSwGZ100=;
	h=DomainKey-Signature:Message-ID:Date:From:User-Agent:MIME-Version:
	 To:CC:Subject:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-System-Of-Record; b=RVbwBbO5J8Rgp5W0z7
	2bKyjfOcSdHLaOUtibsI/EM03wulSbxswFG8krmF4p9ThD4GXhN9JHPeLUE4Zj8SHQP
	A==
In-Reply-To: <20090930130142.16484.76529.stgit@jazzy.zrh.corp.google.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

[cc: -netdev, +netfilter]

Hannes Eder wrote:
> When 'conntrack' is called with no arguments then garbage is printed
> after the usage message.  This patch fixes this.
> 
> Signed-off-by: Hannes Eder <heder@google.com>
> 
>  src/conntrack.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/src/conntrack.c b/src/conntrack.c
> index 42b5133..5ca68d1 100644
> --- a/src/conntrack.c
> +++ b/src/conntrack.c
> @@ -1493,7 +1493,7 @@ int main(int argc, char *argv[])
>  
>  	free_options();
>  
> -	if (exit_msg[cmd][0]) {
> +	if (cmd != CT_NONE && exit_msg[cmd][0]) {
>  		fprintf(stderr, "%s v%s (conntrack-tools): ",PROGNAME,VERSION);
>  		fprintf(stderr, exit_msg[cmd], counter);
>  		if (counter == 0 && !(command & (CT_LIST | EXP_LIST)))
> 

