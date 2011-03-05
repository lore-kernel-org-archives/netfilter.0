From: Alex <mysqlstudent@gmail.com>
Subject: Re: Analyzing DNAT traffic
Date: Sat, 5 Mar 2011 09:23:26 -0500
Message-ID: <AANLkTimhvRGUd-_tb6C10UH8c-cqzcaQFb-OeamMgeuA@mail.gmail.com>
References: <AANLkTimVukQe-ZFsYX_OuFdNV8-buwPHhFh5J768ugqs@mail.gmail.com>
	<314641299313152@web72.yandex.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=Jvo6pEY47PRsNLsRf9duvEYOzvzUONL+YCRNKQNgGFY=;
        b=h9x07BRmjGlJq+ogf40DWUxp2eoCOIAgBnC9o7NvbWP+iboeEOJXElcqGd6KOCXVCp
         flicU24Fb6xJZIWGHAReRusU6/BWM14qb1akJBJDCU9pZ4uioc8qE+lx4rs1kzzIijWh
         bP+RRo9Wp0IJKxOZExEIGXCYtenu+iZgKzeus=
In-Reply-To: <314641299313152@web72.yandex.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Oleg A. Arkhangelsky" <sysoleg@yandex.ru>
Cc: netfilter@vger.kernel.org

Hi,

>> How can I analyize this traffic to determine if it should be forwarded
>> on to its intended internal recipient, or if it is completely
>> unrelated traffic that should continue to be blocked?
>
> Could you please check, does such packets match the following
> rule?
>
> iptables -I FORWARD -m conntrack --ctstate INVALID -j LOG

How will I be able to recognize such an entry in the logs? Is there a
way I can add a tag to the log entry so I can be sure?

Thanks,
Alex
