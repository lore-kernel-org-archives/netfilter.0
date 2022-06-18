From: Amish <anon.amish@gmail.com>
Subject: Re: iptables 1.8.8 fails with error code 111 but iptables 1.8.7
 succeeds with same script
Date: Sat, 18 Jun 2022 10:57:41 +0530
Message-ID: <f92c8f5d-4a39-ac08-749e-3f6c5206d329@gmail.com>
References: <f8b1ba7f-2d59-e068-92ca-a139959aa2fd@gmail.com>
 <20220617150931.GA19244@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WdT1qlrktoKxw2WOCuRjhn6/gzNxRGDlmPmvhZVo9W8=;
        b=f/KNoTp5Yt9IuLlt1rodZw6b3cxBT99i49paCX+TuF6sQ/Q2PreqVIFEWYN3tZzNOb
         agVKdo2heaUHLEJRRyQv2I0YRiqPx/F1ZmBpkqBXruF6WyUqxuc25nfpFIxWrGi9ZKqV
         VTxHlRyNXZW/9qlf9QjQbhd8awZJvvdrX9cgLD01O/g/18oWHw7ftq0DQsBP/Ljl51/E
         OLlw01FVnAHRdgWUlas9Bagdawyi8uKtYQNDPxd2IEJiNgd96iDe4FPnCMbMK+dOsyhW
         960z8iCwE4Zqo649Pb/zwGjyJMhZ7Y1wDfQJNVZGJw1Mj7W/gzJgO5fC5x+4oUaQAwpg
         wncQ==
Content-Language: en-US
In-Reply-To: <20220617150931.GA19244@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter <netfilter@vger.kernel.org>


On 17/06/22 20:39, Florian Westphal wrote:
> Amish <anon.amish@gmail.com> wrote:
>> I use Arch Linux. Apache 2.4.54 and iptables 1.8.8 (nft based).
>>
>> I have a setuid script, given below, which runs via apache httpd and simply
>> calls "iptables -w -nvL INPUT" and gives the output.
>>
>> But with iptables 1.8.8 it fails with error code 111 (undocumented code)
>>
>>> curl http://127.0.0.1/ipt.e
>> EUID = 0, EGID=33
>> iptables exited with exit code=111
>> iptables exited with exit code=111
>
>> The C script follows: (Can be used for testing)
>> int my_system(const char *program, char *const argv[])
>> {
>>      pid_t pid = fork();
>>      if (pid==(pid_t)-1) return -1;
>>      if (!pid) { execve(program, argv, environ); exit(127); }
> iptables evaluates some environment variables and trusts that info.
> If you absolutely have to do this, re-set environ so that someone
> else calling this wrapper can't use it to load their own
> modules/targets.
>
> Then add a 'setuid(0)' before execve.

Great thank you very much for your clarification.

For those who use setuid scripts, here is what I did:

For safety I added this in main() function:

unsetenv("XTABLES_LIBDIR");
unsetenv("IPTABLES_LIB_DIR");
unsetenv("IP6TABLES_LIB_DIR");

And just before execve() I added:
setuid(geteuid());

Hope it helps.

Thanks and regards,

Amish

