From: Ken-ichirou MATSUZAWA <chamas@h4.dion.ne.jp>
Subject: Re: ulogd packet based logging with CT info
Date: Fri, 3 Sep 2021 07:28:45 +0900
Message-ID: <YTFQHZk8Z1ZrCRHd@gmail.com>
References: <20210815143118.GA15248@salvia>
 <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
 <CAMEa=f=nzCzM-9a5B0VEkjN5zXgCTqobGe-sgN2K0G_5QgjdAQ@mail.gmail.com>
 <20210818072256.GA4640@salvia>
 <CAMEa=fkLW2jCoQj982VtZe84YtXdTerZTyOMUaMK+5v0-EhUXQ@mail.gmail.com>
 <20210818115228.GA9294@salvia>
 <CAMEa=f=Z0Uh9jtLi_Le4pR9PSmoUxs71fb_73OHngSwXF4PTyA@mail.gmail.com>
 <20210819101628.GA2036@salvia>
 <CAMEa=f=Or70aNKCiw6=SRG0wQxbdG51HhP6jBZsbKhUcTqaNqA@mail.gmail.com>
 <20210819170330.GA7011@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2bu9HnVXIs/hz+6uiMd4GTcOv9hQzHdvwe/7iRlJh38=;
        b=ZpEJ8AUhpmiO2rZ7YKYrL8aoX+bUQT4uzeVhnGCo8rQMllSB4uTTNt7SKZXlgGkBhc
         k2A0arqLN+IyTEgbguVYB2qhcl1zjtQ0fyZX3NU8YDlBO1FyOiavX0J4PUoTEYfDREN0
         ST0/qzcGEhwq1hxbpgjpj0tEkGbkWu3azO0Fxlm6/87MiFkBma0nU1wCTgQ3pYVxyuh2
         S99yZopgA+vrDE1e0vupAAExh5PYllZBlPkxFDrUS58oo25ytNFTNDEpOx1AePW/y0MZ
         VV1U6ogN2lLu971Vzk3seUQaTTYJH/S/T8SnDk/DfCtYds0aBedBioW9JLc2rkQjefqA
         UQKw==
Sender: Ken-ichirou MATSUZAWA <chamaken@gmail.com>
Content-Disposition: inline
In-Reply-To: <20210819170330.GA7011@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>, =?utf-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Cc: netfilter@vger.kernel.org

 Hi,

On 08/19, Pablo Neira Ayuso wrote:
> On Thu, Aug 19, 2021 at 04:05:41PM +0200, Blažej Krajňák wrote:
> > Could it be useful to prepare patch to add this to ulogd2?
> 
> I think so, yes.
> 
> > As new input plugin or as a upgrade to inppkt_UFLOG?
> 
> Better if you integrate it into the existing plugin.

May I follow up on this?

thanks,
