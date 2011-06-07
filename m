From: Clemens Eisserer <linuxhippy@gmail.com>
Subject: Re: [NFLOG] How to determine the connection a packet belongs to?
Date: Tue, 7 Jun 2011 12:40:07 +0200
Message-ID: <BANLkTi=7eDTNM+OEuDnZucX2sc4Bck_Q6w@mail.gmail.com>
References: <BANLkTimnO5UzNvq6SfuWc7osck=QL=HrMw@mail.gmail.com>
	<4DED6538.3090404@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type;
        bh=YLp0CNHUOrA8ruHJ8NQrlpWqcIHzkCyodl8FHx5JfTI=;
        b=luM+Nbv9z/HPvxfKzafii9b3SN+q6x+IbCbpopayOws9Cwdq6Nk0JJTsZlriirGDF7
         mc8272hLMC0UCk+XZLIqZ1MgHYz+hi3jekrmf0w9Lmxxf8b+rUiBTug+TVeiF/JuCP4/
         2JLvJxvM0s8EL+6sYreReF5+nlBiUspuW4nos=
In-Reply-To: <4DED6538.3090404@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

> You can build the tuple from the packet in user-space to look up the
> conntrack via libnetfilter_conntrack.

How can I do that?

Assuming there are two open connections:
IP1:80       <----> IP2:39678
IP1:39678 <-----> IP2:80

How can I know which packet belongs to which connection?

Thanks, Clemens
