From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Modify packet without NAT
Date: Sun, 18 Jun 2023 17:18:33 +0100
Message-ID: <20230618171833.6ce0835a22deed6aa70b4145@plushkava.net>
References: <GYTTaXkbSkEr3VAyArWUUy2ZOCgqBJ91AiJN2WBVdBUQrUJaHAUkn42u5EVDlPZXwlUJW49u1XMxGnJku_TPIRqLB4KXyBWUsEnw2LWef-k=@proton.me>
        <68081ede-21a0-48be-aecc-d959f317bcb5@thelounge.net>
        <Yx2SfoKfezY0BYo1HR62Qk9XK3cFc2OmDz23H29qQEJiSjDuWurALweCqK8aup09tG3q59mUU6_8UFBYCXMC3Y3GMQsqvqhiBaFgYVGZDQY=@proton.me>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1687105115; x=1687191515; bh=3h582xMbE/gv3NJnNT1Dgra0V
        lOwL4KuTUS8odqfX38=; b=R8iGGvENtudtNaFyirjht+GdDcnWtGsJ232vPUznZ
        oHR1wBACMbrVrCuGLlvtpqu2RaFyV/Zt3r6UnXXAz5JKxpO2TPWs51G2tFu5rIha
        6Wq6Jcx6D/gBAHzjWm9JCSfongBEfa65vqCfZmcWRtnoeRqM1pn8sTPRwSPx0TxE
        aHQtJUe5HAcNZjQ+sxCV+UzrQs/FgU1F8DS+VQZbWPhXFNZYMoZ1NFNXsGnRhCBX
        vKaZWDN0mwqUnGplUz5PmOsJfdUzAjxHFpI+rKbD66P9ewmgh1MrP0XEALQNw0q3
        h8oieDRIScvf4MIerR4y1sv1mLpB6XPJN531el/M08M5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1687105115; x=1687191515; bh=3h582xMbE/gv3NJnNT1Dgra0VlOwL4KuTUS
        8odqfX38=; b=l9Gs/ly3t38QQcNT/ENRNdWHTw7dluZjgSJP3OjpNayhIDbcYE+
        hKr6qaJJ4aEfvsZIsK4zMlItbbc2ySO4wmt70ivl6g0pdEnL24+SmRn4ZiOdlksl
        e5Fqny+UXIGuMItY/jTLycF/b/r6fs6+4LMFIzgKabdSEBwS13mArhwA4WGs01Aa
        QuZYe/hb1rFH+rsUe//tg0XgOZxFKylBIFmbH/gjQMKDq5W1FHsgUDwOKAmsH2Pe
        M96J6+ubKR9XqZtdFx9nSvmsCEfSDoaDd5ajIeLEUk8LO15ZoyiDP7UX1k7qWkre
        YaSwAfJtgyFUpIErZQPZLcc/3zJjPsVWzdw==
In-Reply-To: <Yx2SfoKfezY0BYo1HR62Qk9XK3cFc2OmDz23H29qQEJiSjDuWurALweCqK8aup09tG3q59mUU6_8UFBYCXMC3Y3GMQsqvqhiBaFgYVGZDQY=@proton.me>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: public1020 <public1020@proton.me>
Cc: Reindl Harald <h.reindl@thelounge.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sun, 18 Jun 2023 14:34:31 +0000
public1020 <public1020@proton.me> wrote:

> The system is IPv4 and intranet only, suppose I'm going to increase the hash size, 

You should definitely increase the capacity of the conntrack table. I would just add that many rulesets have no particular need for traffic traversing the loopback interface to be tracked. Should this apply to you, some memory can be saved by implementing a rule such as "-t raw -A OUTPUT -o lo -j CT --notrack".

-- 
Kerin Millar
