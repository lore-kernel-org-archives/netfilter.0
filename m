From: Mauricio Tavares <raubvogel@gmail.com>
Subject: Re: Can iptables handle 10G link traffic?
Date: Fri, 18 Dec 2015 13:27:17 -0500
Message-ID: <CAHEKYV6-xCQ9SA1xZderrMJbgDzwY+ZxVadZH_KnLheWwhfJ+w@mail.gmail.com>
References: <CAPgF-fqB8=ekCnZv39qvmgjHjvkXtiCGua0PHVO_19s5YgNRWw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=WwhqIXIu40vPJglKPfd3nJzDwjzljH4u9lF9XxYDYfo=;
        b=z3E+gQCeTSFsXzhUeBt9pQBY3ZYD9Segnkyk5J2QRjXkmnoZZVzHbuL/wGIOVRMPA1
         uX9JnmYeViELDJ7PdTcUSULuUd5nwfryGBzYMTOeH1UTrNuuMEjEwnK2J7jc9YGXU2qV
         yxopLwYMFhTMo+fhB35cBW6xU4ZeOUw+syR1NDTcqUaY6BL7ye/Sg4AM67lc1JH4D0sH
         FjcknxZf0c0j+BiKhiFvFsrCNmekjSKQbWlWNlWDj9xqZ2zkGpKpimEPfxjHhWEjWw/U
         nrCETdb++TThjUgwaMdl04nn3jCnnBo7q/Q6+5Rnt8cFUpwn12nIFkDDmwCHyPD89igh
         nE+A==
In-Reply-To: <CAPgF-fqB8=ekCnZv39qvmgjHjvkXtiCGua0PHVO_19s5YgNRWw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter <netfilter@vger.kernel.org>

On Fri, Dec 18, 2015 at 12:48 PM, Satish Patel <satish.txt@gmail.com> wrote:
> We are planning to implement Linux base firewall to trash unwanted
> traffic. We have 10G link, can iptables handle 10G link traffic?
>
> If yes then
>
> 1. what kins of hardware it require?
> 2. how much Memory it need?
> 3. Any kind of special Linux flavor?
> 4. specific NIC?
>
> Please suggestions are welcome.

      How much traffic? What kind of traffic?

> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
