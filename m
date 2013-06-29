From: Nick Khamis <symack@gmail.com>
Subject: Re: Dabase BAcked IPTables
Date: Fri, 28 Jun 2013 21:21:08 -0400
Message-ID: <CAGWRaZbhje76Lxxp_jr=xGpshyPYz-=k=H3N_XEgeH3nmqPJMg@mail.gmail.com>
References: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com>
	<20130628231910.GE10741@harrier.slackbuilds.org>
	<CAGWRaZYeBkaVrY3YgmgZdi7oUb9jGOkwtCZSnNU0c31wssYkpQ@mail.gmail.com>
	<20130629002801.GG10741@harrier.slackbuilds.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=7KBaDl5kSxd7VJopn8IuBMQhZuE9cW0PkR58QIDHYNE=;
        b=ilP+sdArBCKI8F2jkAef8Pw7UTHg6SRCPYUnay1HyxMBL6A8PpbO9IUYvQ79NLW9qE
         PJPBI+DVhyOo2PRDauIQVfXwbUK+WzNh63vkOPUT1QKg47y/XQOaNFHW1wbvYbifu7HR
         h7oN1+ac/TBruFFfSrfWMx/MrkNCQqS1j43EWg4Hxl3k5foU98Lk3jqw1Xcv8t75RRYz
         AIUjzWfF7fJhit1tHSjv1HqXU8QpUIDxgJ49SOCX9une6neyyBG6iMuQPftKRw6QVoe6
         wJXJAvyo7hjRM7IPV9019kn55PLzKcmPUBlgy22GO11HwF3ablDU5CHUhPBIgDfuasou
         8J0g==
In-Reply-To: <20130629002801.GG10741@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Ooops, I realized how many blanks I am leaving in my messages. The
website is only used to allow the user to enter their mac address in
order to have access to our services (not HTTP).

Yes, ./iptables.sh is the ruleset script.

>> When you update your ipset, any rule referring to that set uses the
>> new set right away. There would be no point in dumping and then
>> reloading your ruleset.

Hmm, this covers adding *new* mac or even ip addresses however, how
would delete/modify existing entries dynamically.

Kind Regards.

Nick.
