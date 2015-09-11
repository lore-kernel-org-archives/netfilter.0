From: Vieri Di Paola <vieridipaola@gmail.com>
Subject: Re: iptables TRACE not logged
Date: Fri, 11 Sep 2015 15:31:05 +0200
Message-ID: <CABLYT9i-i5oaXkAmeVSXGbsob5kfcX5RQM8xktzAj7f273BriQ@mail.gmail.com>
References: <CABLYT9hQERBkQWskobkKb8tJ64is48e8_4joAYivjo4a+_e+GA@mail.gmail.com>
	<20150911122803.GA5460@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=QcqK7s/2fXGfFFk/0gyXamE/kPfQeU8Go4EFf68OIeY=;
        b=toyoacuXFnpTbYR0Cti3aKRkX1zFN8fSMH0Rw3C+Htqetuo4XoJWahZUVY87rBFo3c
         fJcXiRpKWsYroFcrIhtuOZ8x97+yJWi+XTvS2sRTuOP6VYd+/1xhTPhK6mYRDCAnWYXJ
         k0lbjjfMJx0sqenfFCIOOMDEnr5k4G72BOtvoiWAwUkpaCIteU2d3X9PKPcdTZBRRY/j
         E8IYOMaL/dXv2xenpfwRUf2n7hoEf+q6aePRcZwrW04CjCZqzQCxP8ecqU04i5HxFcUW
         BjFmyygOVCDhhfT6lSw9obTksFnaF5nxjkI8ncKjr25UFv2FDc5SJJwYyQplAbMue/za
         oAJg==
In-Reply-To: <20150911122803.GA5460@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

[sorry, I previously replied only to Pablo instead of the mailing list]

# cat /proc/net/netfilter/nf_log
 0 NONE (nfnetlink_log)
 1 NONE (nfnetlink_log)
 2 nfnetlink_log (nf_log_ipv4,nfnetlink_log)
 3 NONE (nfnetlink_log)
 4 NONE (nfnetlink_log)
 5 NONE (nfnetlink_log)
 6 NONE (nfnetlink_log)
 7 NONE (nfnetlink_log)
 8 NONE (nfnetlink_log)
 9 NONE (nfnetlink_log)
10 NONE (nfnetlink_log)
11 NONE (nfnetlink_log)
12 NONE (nfnetlink_log)

Do I need to change the backend?
eg. sysctl net.netfilter.nf_log.2=ipt_LOG
