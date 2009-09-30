From: Hannes Eder <heder@google.com>
Subject: Re: [PATCH] conntrack: do not print garbage after the usage message
Date: Wed, 30 Sep 2009 16:00:42 +0200
Message-ID: <4AC3648A.2090506@google.com>
References: <20090930130142.16484.76529.stgit@jazzy.zrh.corp.google.com> <4AC35CA4.6090303@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1254319250; bh=7ttpdSxw6m+uqux1LpnNwl7pKSg=;
	h=DomainKey-Signature:Message-ID:Date:From:User-Agent:MIME-Version:
	 To:CC:Subject:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-System-Of-Record; b=X9Rhh78Ua5CV4W13YM
	ZX9zyLLtzCnONOqG+2TMg1VdP9oVD8jBWn7/FgvjQB8uPls5Jhk4eFprsgnxvyryFr7
	g==
In-Reply-To: <4AC35CA4.6090303@google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hannes Eder wrote:
> [cc: -netdev, +netfilter]
> 
> Hannes Eder wrote:
>> diff --git a/src/conntrack.c b/src/conntrack.c
>> index 42b5133..5ca68d1 100644
>> --- a/src/conntrack.c
>> +++ b/src/conntrack.c
>> @@ -1493,7 +1493,7 @@ int main(int argc, char *argv[])
>>  
>>      free_options();
>>  
>> -    if (exit_msg[cmd][0]) {
>> +    if (cmd != CT_NONE && exit_msg[cmd][0]) {

Ups, this does not work, in case of

# conntrack -L conntrack
...

the final:

conntrack v0.9.13 (conntrack-tools): XXX flow entries have been shown.

Is missing, the following should do the trick.  Sorry for the noise.

From: Hannes Eder <heder@google.com>

When 'conntrack' is called with no arguments then garbage is printed
after the usage message.  This patch fixes this.

Signed-off-by: Hannes Eder <heder@google.com>
---

diff --git a/src/conntrack.c b/src/conntrack.c
index 5ca68d1..0053a28 100644
--- a/src/conntrack.c
+++ b/src/conntrack.c
@@ -1493,7 +1493,7 @@ int main(int argc, char *argv[])

         free_options();

-       if (cmd != CT_NONE && exit_msg[cmd][0]) {
+       if (command && exit_msg[cmd][0]) {
                 fprintf(stderr, "%s v%s (conntrack-tools): ",PROGNAME,VERSION);
                 fprintf(stderr, exit_msg[cmd], counter);
                 if (counter == 0 && !(command & (CT_LIST | EXP_LIST)))


