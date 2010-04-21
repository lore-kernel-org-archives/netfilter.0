From: Lars Nooden <lars.curator@gmail.com>
Subject: Re: mac filtering
Date: Wed, 21 Apr 2010 10:49:24 +0300
Message-ID: <4BCEAE04.8010902@gmail.com>
References: <l2wcfeab66d1004202055jab9b6853ue6b9e80d5da93dc0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=pbxT6zDZ8cuRHl0yD9LKYuJDtNUjc/HZW7k567xZiA8=;
        b=UN9XUO3R9yo24fOXVNGjwa5OsiAe2jjSdJtsT1pZplX4Y/MojoHtRammC2HdluM8Fd
         BB/F6zCjkJbplQEZxmMnpJvGHiATANOAn0jJoYsw3mA5IBHjyFVOeAAG4RZVsdcEfUM3
         /nHBD/s7UX/R5k6yoJxiiSyqTICVpnYNod7dw=
In-Reply-To: <l2wcfeab66d1004202055jab9b6853ue6b9e80d5da93dc0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

On 04/21/2010 06:55 AM, ratheesh k wrote:
> Question : What exactly mac address filter mean ?  disabling router
> access or disabling internet access ?

The rule acts on what the user or that user's system has chosen at that 
particular moment to use as its chosen string to identify the network 
interface when contacting the router.

That kind of filtering is of very limited use in most activities.

/Lars
