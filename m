From: Marc SCHAEFER <schaefer@alphanet.ch>
Subject: Re: IP SNAT in a bridge
Date: Fri, 4 Mar 2022 09:10:50 +0100
Message-ID: <20220304081050.GA2392@alphanet.ch>
References: <20220303204545.GA6798@alphanet.ch>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
        t=1646381473; bh=oq6xvC6YiBxepUPlFYdiYtS4WKzsNr+oxvLwzhBwiCE=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=Xp7+D1MILmo6aNX9r6sOGxgga8x/GU2mCnHWVxjEHUsvQmyTR0quuXKGknUOZGmhC
         S/ceQFZAvCJLWYSe8UdesJnZJK8bygRkPnJ4f0IaS867FvIrRdaBJb1G0lRjQHLn4R
         ivHDRDBh5EIrGVQQhCotShdPs1vs6NsxMFKYmK4yURP0q3BcIoK2mD9/bFH/DJ7BSm
         GsqaoEgCF7EQ6MwzbjKW6Wz7HsTmEyDJyW+G42YRJbaCOtxxLrtYWbAEJAPPA6zAlw
         9086O2RR6gz3l+6j+AHgYFiRkHafGgTBJs1w9J0w0qJDnkzLPz8ms3/q3sD0Ssb1se
         qDu+7GDyEj4ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
        t=1646381468; bh=oq6xvC6YiBxepUPlFYdiYtS4WKzsNr+oxvLwzhBwiCE=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=KUQsLvQQDdW196tkELhw2t8NS75+A3IFRR7K3WPoAlfcs9SJETeFtID4HURjRKMmg
         hjRoLBsk2aUZLqbXU1aGroV/Js1b4W+KaqqA5hMhmQV+fvpWeaPgEmZXu+GSBxpaC3
         ++rC5cYeFXolsYlUjq5k9iigX3EGXZVzPd6FATxfHEer7gNV6KdNtuT9SPIgfiivFP
         6xxUWG4MMknf6fU0KotZd3IMAoJpHF44yL6Y1IpM3xPZ6ooWx3GYmNPemameioCyV6
         FlIjPqT/A3HqoalFsZmC5sXz21nSe1KSxh3gepVKIs79FF6u5wthU85UpLyipKxNJu
         9tGSfG/2bcJUA==
Content-Disposition: inline
In-Reply-To: <20220303204545.GA6798@alphanet.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

On Thu, Mar 03, 2022 at 09:45:46PM +0100, Marc SCHAEFER wrote:
> am I right that this has to be done as a -t nat POSTROUTING -j SNAT
> iptables, but that will only work if ebtables forces the packet into
> BROUTE mode first?

I found out that if the br_netfilter module is loaded, it works without
the BROUTE.  I will investigate if there is a way to do it less globally.
